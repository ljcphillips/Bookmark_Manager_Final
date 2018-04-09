require 'sinatra'

class Bookmark < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, 'key'
  end
  set :root, File.dirname(__FILE__)
  run! if app_file == $0

  get '/' do
    erb(:index)
  end

end
