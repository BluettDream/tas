module.exports = {
    publicPath: '/',
    outputDir: 'tas',
    assetsDir: './',
    devServer: {
        proxy: {
            '/api': {
                target: 'http://localhost',
                ws: true,
                changeOrigin: true,
                pathRewrite: {
                    '^/api': '', // rewrite path
                },
            }
        }
    }
}