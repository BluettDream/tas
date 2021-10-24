module.exports = {
    publicPath: '/tas',
    outputDir: 'package',
    assetsDir: './',
    devServer: {
        proxy: {
            '/tas': {
                target: 'http://localhost:8001',
                ws: true,
                changeOrigin: true,
            }
        }
    }
}