const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    JQuery: 'jquery',
    moment: 'moment',
    identicon: 'identicon'
  })
)

module.exports = environment
