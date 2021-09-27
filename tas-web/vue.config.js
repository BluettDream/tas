module.exports = {
    publicPath: '/tas/',
    outputDir: 'tas',
    assetsDir: './',
    devServer: {
        proxy: {
            '/api': {
                target: 'http:localhost:1218',
                ws: true,
                changeOrigin: true,
                pathRewrite: {
                    '^/api': '', // rewrite path
                },
            }
        }
    }
}