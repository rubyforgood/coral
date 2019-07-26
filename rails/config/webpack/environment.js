const { environment } = require('@rails/webpacker')

// TODO:
// We need the service worker to have a consistent rather than a hashed filename.
// It was easiest to configure webpacker to use consistent bundle filenames
// for all entry points rather than just the service worker.
// THIS IS NOT GOOD AND SHOULD BE FIXED BEFORE PRODUCTION.
// reference for what fixing it might look like:
// https://github.com/webpack/webpack/blob/master/examples/multi-compiler/webpack.config.js
// but it looks like there might be a lot of translation between webpacker & our
// overrides involved in that transition. :(
environment.config.set('output.filename', '[name].js')

module.exports = environment
