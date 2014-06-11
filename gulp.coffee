gulp = require "gulp"
watch = require "gulp-watch"
plumber = require "gulp-plumber"
browserify = require "gulp-browserify"
coffee = require "gulp-coffee"
gutil = require "gulp-util"
sourcemaps = require "gulp-sourcemaps"
less = require "gulp-less"
clean = require "gulp-clean"

gulp.task "browserify", ->
  gulp.src "./public/dist/tmp/js/**/*.js"
  .pipe watch()
  .pipe browserify(insertGlobals:true,debug:true)
  .pipe gulp.dest "./public/dist/js"

gulp.task "compile-js", ->
  gulp.src("./public/src/coffee/**/*.coffee")
  .pipe watch()
  .pipe coffee().on('error', gutil.log)
  .pipe gulp.dest "./public/dist/tmp/js"

gulp.task "clean",->
  gulp.src './public/dist',{read:false}
    .pipe clean()

gulp.task "default", ["clean","compile-js","browserify"]
