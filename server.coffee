express = require "express"
router = express.Router()
path = require "path"
loader = require "auto-loader"

app = new express()

#loader
utils = loader.load "#{__dirname}/utils"

#middlewares
path = require "path"
logger = require "morgan"
cookieParser = require "cookie-parser"
favicon = require "serve-favicon"
bodyParser = require "body-parser"

#callutils
utils.registerRoutes(app,router)

#configs
app.set "view engine","jade"
app.set "views",path.resolve "#{__dirname}/views"
app.use "/",express.static __dirname + "/public"
app.use logger "dev"
app.use bodyParser.urlencoded()
app.use bodyParser.json()
app.use "/",express.static "#{__dirname}/public"

if app.get 'env' == "developement"
  app.use (err,req,res,next)->
    res.status err.status || 500
    req.render 'error',
      message: err.message
      err: err

port = process.env.port || 3000
app.listen port
console.log "listening on the port #{port}"

module.exports = app
