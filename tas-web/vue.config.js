module.exports = {
    publicPath: '/',
    outputDir: 'package',
    assetsDir: './',
    devServer: {
        proxy: {
            '/tas': {
                target: 'http://localhost',
                ws: true,
                changeOrigin: true,
            }
        }
    }
}