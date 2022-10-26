require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # GET /
    get '/' do
        return 'Hello'
    end


  # Root path (homepage, index page)
#   get '/hello' do
#     name = params[:name]
    
#     return "Hello #{name}"
#   end

    get '/names' do
        names = params[:names]

        return names
    end


    post '/submit' do
        name = params[:name]
        message = params[:message]

        return "Thanks #{name}, you sent this message: #{message}"
    end

    post '/sort-names' do
        names = params[:names]
        ordered_names = names.split(",").sort.join(",")

        return ordered_names
    end
  
end