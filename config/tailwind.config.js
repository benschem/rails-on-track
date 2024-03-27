const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    colors: {
      // primary, main, accent
      // 60%,     30%,  10%
      // neutral, color,color
      // https://uicolors.app/create
      primary: {
        DEFAULT: "#faf5f3", // main
        100: "#f7ede9",
        200: "#f0dfd8",
        300: "#e5c8bc",
        400: "#d5a794",
        500: "#c38870",
        600: "#ad6e55",
        700: "#905a45",
        800: "#784d3c",
        900: "#664436",
        950: "#362119",
      },
      secondary: {
        50: "#f9f6f8",
        100: "#f3f0f2",
        200: "#e9e1e7",
        300: "#d8c9d3",
        400: "#bfa7b7",
        500: "#aa8a9e",
        600: "#927084",
        700: "#7b5b6c",
        DEFAULT: "#694f5d",
        900: "#58434f",
        950: "#32252c",
      },
      accent: {
        50: "#f2f7f2",
        100: "#e1ebe0",
        200: "#c4d6c5",
        300: "#9cb99f",
        DEFAULT: "#709775",
        500: "#507956",
        600: "#3c5f42",
        700: "#304c36",
        800: "#283d2c",
        900: "#213325",
        950: "#121c15",
      },
      alert: {
        50: "#fef2f2",
        100: "#fde7e6",
        200: "#fbd0d2",
        300: "#f7aaad",
        400: "#f27a82",
        500: "#e94a59",
        DEFAULT: "#d62b44",
        700: "#b31d36",
        800: "#961b34",
        900: "#811a32",
        950: "#480916",
      },
      black: colors.black,
      white: colors.white,
      grey: colors.slate,
    },
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      screens: {
        "3xl": "2100px",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
