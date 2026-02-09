require_relative 'gossip'
class ApplicationController < Sinatra::Base # new Class Application herit of class Sinatra (from gem)
  get '/' do
    erb :index, locals: {gossips: Gossip.all} # locals method : bridge between variables/erb(html)
  end
  get '/gossips/new/' do #display the given url page
    erb :new_gossip
  end
  post '/gossips/new/' do #send data entered by user in form
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    puts "Bravo ! Nouveau gossip enregistré dans la DB !"
    redirect '/'
  end
  get '/gossips/:id/' do #show single gossip page by id
    erb :show, locals: {gossip: Gossip.find(params['id'])}
  end
  get '/gossips/:id/edit/' do #edit single gossip page by id
    erb :edit, locals: {gossip: Gossip.find(params['id'])}
  end
  post '/gossips/:id/edit/' do #send new data of a modified gossip in the 'edit form'
    Gossip.update(params['id'].to_i, params["gossip_author"], params["gossip_content"])
    puts "Parfait ! Le gossip a bien été modifié !"
    redirect '/'
  end
end