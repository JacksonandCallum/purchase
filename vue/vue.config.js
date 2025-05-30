const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  lintOnSave: false,
  devServer: {
    port: 8080
  },
  chainWebpack: config =>{
    config.plugin('html')
        .tap(args => {
          args[0].template = './public/index.html'; // 指定唯一的 HTML 模板
          args[0].title = "采购流程系统";
          return args;
        })
  }
})
