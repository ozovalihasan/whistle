const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim}',
    "./config/initializers/simple_form.rb"
  ],
  safelist: [
    "fixed",
    "top-0",
    "left-0",
    "w-full",
    "h-full",
    "h-[50px]",
    "w-[50px]",
    "h-[25px]",
    "w-[25px]",
  ],
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      first: "#15202b",
      second: "#1da1f2",
      third: "#657786",
      fourth: "#f5f8fa",
      sixth: "#9ab3c7",
      danger: colors.red,
      white: colors.white,
    },
    fontFamily: {
      'sans': ['Lato', ...defaultTheme.fontFamily.sans],

    },
    extend: {
      blur: {
        xs: '2px',
      },
      animation: {
        'one-time-ping': 'pulse 2s cubic-bezier(0.05, 0.05, 0.5, 0.95) 1'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
