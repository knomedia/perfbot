# Description:
#   Get a link to view controller actions in grafana
#
# Commands:
#   hubot grafaname <controller> <action> [timeshift] - returns back a canvas grafana link, include the word timeshift to include it in the graph
#
# Configuration:
#   HUBOT_GRAFANA_URL (url to grafana i.e. https://grafana.site.com)
#
# Notes:
#   This is pretty specific to a grafana scripted dashboard we have...

slackMessage = require('../lib/slack_message')


hasTimeShift = (args) ->
  args.join('**').match(/timeshift/)

module.exports = (robot) ->

  robot.respond /grafaname (.*)/, (msg) ->
    args = msg.match[1].split(' ')
    controller = args[0]
    action = args[1]
    url = process.env.HUBOT_GRAFANA_URL + '/#/dashboard/script/request.js'
    url += '?controller=' + controller
    url += '&action=' + action
    if hasTimeShift(args.slice(2))
      url += '&timeshift=true'
    slackMessage(robot, msg, url, args.join(' '))
