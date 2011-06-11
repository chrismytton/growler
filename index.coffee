# Express for quickly assembling an app
express = require 'express'

# Growl or libnotify for those damn notifications
alerter = require if process.platform is 'darwin' then 'growl' else 'libnotify'

# Build an express app that catches all requests and displays a notification
app = express.createServer(
  # Parse JSON out of incoming requests
  express.bodyParser()

  # Catch all requests and display a notification
  (req, res) ->
    alerter.notify JSON.stringify(req.body), { title: req.url, app: "Growler" }, ->
      # Send the response as a 200, OK
      res.send()
)

# Fire up the server
app.listen 3000, ->
  # Let the user know where to continue their quest
  console.log "Growler listening on port #{app.address().port}"
