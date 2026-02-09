class ApplicationController < Sinatra::Base # new Class Application herit of class Sinatra (from gem)
  get '/gossips/new/' do #display the given url page
    erb :new_gossip
  end
  post '/gossips/new/' do #send data entered by user in form
  puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
  end
end