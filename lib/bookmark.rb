require 'pg'
require 'pry'

class Bookmark

attr_reader :url, :title

  def initialize(url, title)
    @url = url
    @title = title
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmark")
  end

  def self.create(bookmark)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmark (url, title) VALUES('#{bookmark.url}',  '#{bookmark.title}');")
  end

  def self.delete(bookmark)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    query = "DELETE FROM bookmark WHERE title = '#{bookmark[0]}'"

    if bookmark.length > 1
        bookmark.each_with_index do |one_bookmark, index|
          if index > 0
            query += " OR title = '#{one_bookmark}'"
          end
        end
        query + ";"
    end
    connection.exec(query)
  end

  def self.search(params)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    p connection.exec("SELECT * FROM bookmark WHERE title = '#{params}'")
  end

  def self.update(params)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    # connection.exec("UPDATE bookmark SET url = #{params[:url]} WHERE id = '#{@id}'")
    p connection.exec("UPDATE bookmark SET title = '#{params[:title]}' WHERE id = '#{params[:id]}'")
  end

end
