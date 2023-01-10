require 'sinatra/base'
require 'sinatra/reloader'


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end
  # GET /
  # Root path (homepage,index page)
  get '/hello' do 
    return erb(:index)
  end

  get '/names' do
    names = params[:names]
    return "#{names}"
  end

  post '/sort_names' do
    names = params[:names]
    return names.split(',').sort.join(',')
  end
end

# Incoming request : GET /todos/1

# Routes 

#  GET / -> execute some code 

# GET /todos/1 => execute different piece of code 

# POST /todos => execute different code 

