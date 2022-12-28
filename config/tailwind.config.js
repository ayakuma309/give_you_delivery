const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.css',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require("daisyui")
  ],
  daisyui: {
    themes: [
      {
      mytheme: {
        "primary": " #42A0FF",
        "secondary": " #42A0FF",
        "accent": "#81D0CB",
        "neutral": "#191A3E",
        "base-100": "#FFFFFF",
        info:  "#FFDC5D",
        "success": "#fef08a",
      },
    },
  ],
  },
}
