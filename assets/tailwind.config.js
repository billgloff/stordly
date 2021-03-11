module.exports = {
  purge: {
    content: [
      '../lib/**/*.ex',
      '../lib/**/*.leex',
      '../lib/**/*.eex',
      './js/**/*.js'
    ],
    options: {
      whitelist: []
    }
  },
	theme: {},
  variants: {},
  plugins: [require("kutty")]
}
