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
    request = msg.http('https://gist.githubusercontent.com/miyay/7b814acfd67920300787/raw/8d61059f8644e8849c58fc6ca37f4ed3da682145/hymm.json').get()
    request (err, res, body) ->
      json = JSON.parse(body)
      word = json[msg.match[1]]

      if word
        msg.send(word)
      else
        msg.send("Sorry, I found no result")
