module.exports = (app,router)->
  loader = require "auto-loader"
  path = require "path"
  routePath = path.resolve "#{__dirname}/../routes"
  routeObjects = loader.load routePath
  keys = Object.keys routeObjects
  for k in keys
    app.use routeObjects[k].pathname,routeObjects[k].call(this,router)