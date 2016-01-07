# Description:
#   Translate Japanese - Hymmnos
#
# Commands:
#   hubot hym <word>
#
# Notes:
#   Hymmnoserver http://game.salburg.com/hymmnoserver/
#
# Autho
#   miyay

module.exports = (robot) ->
  robot.respond /hym (.*)./i, (msg) ->
    request = msg.http('https://gist.githubusercontent.com/miyay/7b814acfd67920300787/raw/8d61059f8644e8849c58fc6ca37f4ed3da682145/hymm.json').get()
    request (err, res, body) ->
      json = JSON.parse(body)
      words = msg.match[1].split(" ")

      words.forEach (word, index) ->
        dic = json[word]

        if dic
          msg.send(dic)
        else
          msg.send("Sorry, I found no result")
