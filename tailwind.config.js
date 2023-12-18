module.exports = {
    darkMode: 'class',
    content: [
      "./src/**/*.{html,js}",
      "./node_modules/flowbite/**/*.js"
    ],
    theme: {
      extend: {
        colors: {
          book: {
            "night":           "#14151A",
            "white":           "#FFFFFF",
            "robin-egg-blue":  "#4ECDC4",
            "tiffany-blue":    "#70D7D0",
            "light-red":       "#FF6B6B",
            "naples-yellow":   "#FFE66D",
          }
        }
      },
      fontFamily: {
        serif: ["Merriweather", "serif"],
        'body': [
      'Merriweather', 
      'ui-sans-serif', 
      'system-ui', 
      '-apple-system', 
      'system-ui', 
      'Segoe UI', 
      'Roboto', 
      'Helvetica Neue', 
      'Arial', 
      'Noto Sans', 
      'sans-serif', 
      'Apple Color Emoji', 
      'Segoe UI Emoji', 
      'Segoe UI Symbol', 
      'Noto Color Emoji'
    ],
        'sans': [
      'ui-sans-serif', 
      'system-ui', 
      '-apple-system', 
      'system-ui', 
      'Segoe UI', 
      'Roboto', 
      'Helvetica Neue', 
      'Arial', 
      'Noto Sans', 
      'sans-serif', 
      'Apple Color Emoji', 
      'Segoe UI Emoji', 
      'Segoe UI Symbol', 
      'Noto Color Emoji'
    ]
      },
    },
    plugins: [
      require('flowbite/plugin')
    ],
  }