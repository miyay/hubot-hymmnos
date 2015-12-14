# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.respond /hym (.*)/i, (msg) ->
    request = msg.http('https://gist.githubusercontent.com/miyay/7b814acfd67920300787/raw/cbd4ca890f8fadd345626bb73ccd765c0805c494/hymm.json').get()
    request (err, res, body) ->
      json = JSON.parse(body)
      word = json[msg.match[1]]

      if word
        msg.send(body)
        msg.send("#{msg.match[1]} : #{word[0]}(#{word[1]}) / #{word[2]}")
      else
        msg.send("Sorry, I found no result")
