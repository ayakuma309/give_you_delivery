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
          primary: "#FAB4B5",
          secondary:  "#F8D1D9",
          accent: "#DF3419",
          neutral: "#616161",
          warning: "#fb7185",
          info: "#FFDC5D",
          success: "#fef08a",
          "base-100": "#ffffff",
          fontFamily: "Chalkboard"
        },
      },
    ],
  }
}
