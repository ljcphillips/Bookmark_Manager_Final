require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, 'key'
  end

  run! if app_file == $0

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

end
