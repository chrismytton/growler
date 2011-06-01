express = require 'express'
growl = require 'growl'

app = express.createServer()

app.configure ->
  app.use express.bodyParser()

app.use (req, res) ->
  growl.notify JSON.stringify(req.body), { title: req.url, app: "Growler" }, ->
    res.send()

app.listen 3000, ->
  console.log "Growler listening on port #{app.address().port}"
