require "capybara/rspec"
require "./app/app"

describe Bookmark do

  feature "Show homepage" do
    scenario "user goes to / path to view homepage" do
      visit "/bookmarks"
      expect(page).to have_content "Bookmark Manager"
      expect(page).to have_content "facebook.com"
      expect(page).to have_content "google.com"
    end
  end
end
