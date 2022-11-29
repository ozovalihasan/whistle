const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
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
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
