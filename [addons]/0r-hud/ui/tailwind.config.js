import plugin from "tailwindcss/plugin";

/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  darkMode: "class",
  theme: {
    extend: {
      fontFamily: {
        Roboto: "Roboto Mono",
      },
      textShadow: {
        sm: "0 2px 20px var(--tw-shadow-color)",
        DEFAULT: "0 2px 12px var(--tw-shadow-color)",
        lg: "0 8px 16px var(--tw-shadow-color)",
      },
      transitionProperty: {
        width: "width",
        height: "height",
      },
      textColor: {
        x_green: "#05483A",
      },
      colors: {
        super_green: "#04BF9E",
        settings_green: "#05d78d",
        settings_gray: "#b2b3b6",
        settings: "#22283c",
      },
    },
  },
  plugins: [
    plugin(function ({ matchUtilities, theme }) {
      matchUtilities(
        {
          "text-shadow": (value) => ({
            textShadow: value,
          }),
        },
        { values: theme("textShadow") }
      );
    }),
  ],
};
