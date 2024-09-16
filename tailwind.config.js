import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.tsx',
    ],

    theme: {
        fontFamily: {
            cursive: ['"Great Vibes"', "cursive"],
        },
        extend: {
            fontFamily: {
                serif: ['"Vollkorn Variable"', ...defaultTheme.fontFamily.serif],
            },
            colors: {
                rust: '#ba5912',
                mustard: '#dfb01c',
                night: '#003943',
                rose: '#eecabf',
                sage: '#9aa794',
                snow: '#f0ebdd',
            },
        },
    },

    plugins: [forms],
};
