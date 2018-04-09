require './lib/bookmark'

describe Bookmark do

  describe ".all" do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://destroyallsoftware.com")
      expect(bookmarks).to include("http://makersacademy.com")
      expect(bookmarks).to include("google.com")
    end
  end
end
