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


#binding.pry



