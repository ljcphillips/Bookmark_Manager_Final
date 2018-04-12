require 'sinatra/base'
require './lib/bookmark'
require 'pry'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  configure do
    enable :sessions
    set :session_secret, 'key'
    register Sinatra::Flash
  end

  run! if app_file == $0

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/bookmarks/new' do

    if params[:url] == ""
      flash[:error] = "No URL"
    elsif params[:url] =~ URI::regexp
      Bookmark.create(Bookmark.new(params[:url], params[:title]))
    else
      flash[:error] = "Invalid URL"
    end

    redirect '/bookmarks'
  end

  post '/bookmarks/update' do

    if params[:url] == ""
      flash[:error] = "No URL"
    elsif params[:url] =~ URI::regexp
      Bookmark.create(Bookmark.new(params[:url], params[:title]))
    else
      flash[:error] = "Invalid URL"
    end

    redirect '/bookmarks'
  end

  post '/bookmarks/delete' do
    Bookmark.delete(params[:delete])
    redirect '/bookmarks'
  end

end
