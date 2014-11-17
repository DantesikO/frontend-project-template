gulp			= require 'gulp'
stylus			= require 'gulp-stylus'
csscomb			= require 'gulp-csscomb'
cmq				= require 'gulp-combine-media-queries'
cssmin			= require 'gulp-cssmin'
autoprefixer	= require 'gulp-autoprefixer'
paths			= require '../paths.coffee'
pkg				= require '../../package.json'
errhandler		= require '../errhandler.coffee'

module.exports = ->
	gulp.src paths.stylus.src
		.pipe stylus()
			.on 'error', errhandler
		.pipe do csscomb
		.pipe do cmq
		.pipe autoprefixer [
			'Android >= '	+ pkg.browsers.android,
			'Chrome >= '	+ pkg.browsers.chrome,
			'Firefox >= '	+ pkg.browsers.firefox,
			'Explorer >= '	+ pkg.browsers.ie,
			'iOS >= '		+ pkg.browsers.ios,
			'Opera >= '		+ pkg.browsers.opera,
			'Safari >= '	+ pkg.browsers.safari
		]
		.pipe do cssmin
		.pipe gulp.dest paths.stylus.dest
		