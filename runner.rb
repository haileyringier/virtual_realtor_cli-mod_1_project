require_relative 'config/environment'
#require "tty-prompt"

#starts a new cli instance, is the app
app = Cli.new

#welcome method app.welcome
app.welcome_user
app.bedroom_prompt
app.bathroom_prompt
app.backyard_prompt
app.client_location
app.house_filter
app.view_house
app.new_viewing
app.houses_viewed
# app.buy_house

#binding.pry



