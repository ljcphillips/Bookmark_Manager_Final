require 'sinatra/base'
require './lib/bookmark'
require 'pry'

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

  post '/bookmarks/new' do
    Bookmark.create(params[:url])
    redirect '/bookmarks'
  end

  post '/bookmarks/delete' do
    redirect '/bookmarks'
  end

end
