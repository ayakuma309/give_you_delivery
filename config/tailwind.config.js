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
    require("daisyui"),
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          primary: "#42A0FF",
          secondary:  "#81D0CB",
          accent: "#7dd3fc",
          neutral: "#191A3E",
          warning: "#fecaca",
          info: "#FFDC5D",
          success: "#fef08a",
          "base-100": "#ffffff",
          fontFamily: "Chalkboard"
        },
      },
    ],
  }
}
