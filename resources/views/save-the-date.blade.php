<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="noindex">

        <title>{{ config('app.name', 'Save the Date') }}</title>

        @vite(['resources/css/app.css'])
    </head>
    <body class="font-sans antialiased text-snow bg-sage">

    <main class="h-screen flex flex-col items-center justify-center">
        <h1 class="text-center text-7xl md:text-9xl font-cursive mb-14 drop-shadow-xl">Save the Date</h1>
        <div>
            <div class="font-serif drop-shadow-xl mb-14">
                <p class="text-5xl font-semibold uppercase text-center">Samstag</p>
                <div class="border-b-[3px] border-b-snow leading-none"></div>
                <p class="text-[11rem] text-center leading-none font-semibold lining-nums">
                    30
                </p>
                <div class="border-b-[3px] border-b-snow leading-none mt-[-28px]"></div>
                <p class="text-4xl text-center font-semibold leading-none">August • 2025</p>
            </div>
        </div>
        <div class="font-serif text-3xl drop-shadow-xl">
            Sögel / Surwold
        </div>
    </main>
    </body>
</html>
