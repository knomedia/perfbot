# Description:
#   Provide a health check endpoint
#
module.exports = (robot) ->
  robot.router.get '/', (req, res) ->
    res.send 'OK'
  robot.router.get '/health_check', (req, res) ->
    res.send 'OK'
