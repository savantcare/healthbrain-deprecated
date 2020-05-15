module.exports = {
  transpileDependencies: [],

  pwa: {
    themeColor: '#17a2b8',
    msTileColor: '#000000',
    iconPaths: {
      msTileImage: 'img/icons/mstile-150x150.png'
    }
  },

  configureWebpack: {
    devtool: 'source-map'
  },

  pluginOptions: {
    i18n: {
      locale: 'en',
      fallbackLocale: 'en',
      localeDir: 'locales',
      enableInSFC: true
    }
  }
}
