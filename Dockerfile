FROM oven/bun:1-alpine AS frontend

COPY package.json bun.lockb vite.config.js tailwind.config.js postcss.config.js ./
# copy is weird with directories, so we have to copy resources in a seperate step
COPY ./resources ./resources
RUN bun install && bun run build


FROM dunglas/frankenphp:php8.3-alpine

ARG USER=web

RUN install-php-extensions \
	intl \
	pcntl \
	apcu \
	zip \
	opcache
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer


RUN adduser -D ${USER}; \
    chown -R ${USER}:${USER} /data/caddy \
    && chown -R ${USER}:${USER} /config/caddy \
    && chown -R ${USER}:${USER} /app

USER ${USER}

COPY --chown=${USER}:${USER} . /app

RUN composer install --no-interaction --no-dev --classmap-authoritative --no-scripts \
    && php artisan storage:link \
    && php artisan optimize:clear \
    && php artisan clear-compiled \
    && php artisan package:discover \
    && composer clear-cache

COPY --from=frontend --chown=${USER}:${USER} /home/bun/app/public/build ./public/build

ENTRYPOINT ["sh", "docker/start.sh"]
