pkg = require('./package.json')
del = require('del')
gulp = require('gulp')
chmod = require('gulp-chmod')
coffee = require('gulp-coffee')
rename = require('gulp-rename')
header = require('gulp-header')

gulp.task 'clean', (cb) ->
	del(['lib'], cb)

gulp.task 'lib', ['clean'], ->
	gulp.src(['src/**/*'])
		.pipe(coffee(bare: true))
		.pipe(gulp.dest('lib'))

gulp.task 'bin', ['lib'], ->
	gulp.src(['cli.coffee'])
		.pipe(coffee(bare: true))
		.pipe(rename("#{pkg.name}"))
		.pipe(header('#!/usr/bin/env node\n\n'))
		.pipe(chmod(755))
		.pipe(gulp.dest('bin'))

gulp.task 'watch', ['bin'], ->
	gulp.watch ['src/**/*'], ['lib']
	gulp.watch ['cli.coffee'], ['bin']

gulp.task 'default', ['watch']