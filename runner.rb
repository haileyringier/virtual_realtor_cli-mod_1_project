require_relative 'config/environment'
#require "tty-prompt"

#starts a new cli instance, is the app
app = Cli.new


app.welcome_user
app.house_quiz
app.view_house
app.view_new_house
app.houses_viewed
app.buy_house
app.delete
app.goodbye


