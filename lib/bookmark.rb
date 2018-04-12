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
    result.map { |link| link }
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
    binding.pry
    query = "DELETE FROM bookmark WHERE url = '#{bookmark[0]}'"

    if bookmark.length > 1
        bookmark.each_with_index do |one_bookmark, index|
          if index > 0
            query += " OR url = '#{one_bookmark}'"
          end
        end
        query + ";"
    end
    connection.exec(query)
  end
end
