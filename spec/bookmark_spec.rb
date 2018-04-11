require './lib/bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmark (url) VALUES ('http://makersacademy.com');")
      connection.exec("INSERT INTO bookmark (url) VALUES('http://destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmark (url) VALUES('http://google.com');")

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://destroyallsoftware.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end
end
