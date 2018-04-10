require "capybara/rspec"
require "./app/app"


  feature "Show homepage" do
    scenario "user goes to / path to view homepage" do
      visit "/bookmarks"
      expect(page).to have_content "http://makersacademy.com"
      expect(page).to have_content "http://destroyallsoftware.com"
      expect(page).to have_content "google.com"
    end
  end
