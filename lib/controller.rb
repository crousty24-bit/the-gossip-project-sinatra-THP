class ApplicationController < Sinatra::Base # new Class Application herit of class Sinatra (from gem)
  get '/' do
    erb :index
  end
end