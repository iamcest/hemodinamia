const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

const paths = {
  static: path.join(__dirname, '../priv/static'),
  build: path.join(__dirname, '../priv/static/fonts'),
  build: path.join(__dirname, '../priv/static/images'),
  node_modules: path.join(__dirname, '../node_modules'),
  src: path.join(__dirname, './'),
};

module.exports = (env, options) => ({
  optimization: {
    namedChunks: true,
    /*
    splitChunks: {
      chunks: "all",
      maxInitialRequests: Infinity,
      minSize: 0,
      cacheGroups: {
        vendor: {
          test: /[\\/]node_modules[\\/]/,
          name(module) {
            const packageName = module.context.match(
              /[\\/]node_modules[\\/](.*?)([\\/]|$)/,
            )[1]
            return `npm.${packageName.replace("@", "")}`
          },
        },
      },
    },
    */
    minimizer: [
     // new UglifyJsPlugin({cache: true, parallel: true, sourceMap: false}),
     new UglifyJsPlugin({
			cache: true,
			parallel: true,
			sourceMap: true,
			uglifyOptions: {
				compress: {
					drop_console: true
				}
			}
		}),
      new OptimizeCSSAssetsPlugin({}),
    ],
  },
  entry: {
    app: ['./js/app.js'].concat(glob.sync('./vendor/**/*.js')),
    draw_coronary: './js/draw_coronary/draw_coronary.js',
    draw_sat_pres: './js/draw_sat_pres/draw_sat_pres.js',
    draw_lv: './js/draw_lv/draw_lv.js'
  },
  output: {
    path: path.resolve(__dirname, '../priv/static/js'),
     //filename: 'app.js',
      filename: "[name].js",
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
         loader: 'babel-loader',
        },
      },
      {
        test: /\.s?css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
      },
      {
        test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
        use: [
          {
            loader: 'file-loader',
            options: {
               name: '[name].[ext]',
              outputPath: '../fonts',
              //publicPath: '../priv/static/fonts/'
              // publicPath: '../', // override the default path
            },
          },
        ],
      },
    ],
  },
  //{
  //        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?(\?.*$|$)/,
  //       use: 'url-loader?&limit=10000&name=/fonts/[name].[ext]',
  // },
  // {
  //    test: /\.(eot|ttf|otf)?(\?.*$|$)/,
  //    loader: 'file-loader?&limit=10000&name=/fonts/[name].[ext]',
  //  },
  // ]
  //},
  plugins: [
    new MiniCssExtractPlugin({filename: '../css/app.css'}),
    new CopyWebpackPlugin([{from: 'static/', to: '../'}]),
	//  new webpack.ProvidePlugin({
	  //  $: 'jquery',
	  //  jQuery: 'jquery',
	  // }),
  ],
});
