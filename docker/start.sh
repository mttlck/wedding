#!/usr/bin/env sh

set -e

cd /app || exit

ls -la

php -r "echo(__DIR__);"
php -r "file_exists('storage/database.sqlite') || touch('storage/database.sqlite');"

echo "running migrations"
php artisan migrate --force
# todo: run seeders when in staging

echo "warming up"
php artisan optimize:clear
php artisan optimize

echo "starting server"
php artisan octane:frankenphp
