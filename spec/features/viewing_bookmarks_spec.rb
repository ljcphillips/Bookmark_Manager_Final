require "capybara/rspec"
require "./app/app"
require 'pry'

  feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmark VALUES(1, 'http://makersacademy.com');")
    connection.exec("INSERT INTO bookmark VALUES(2, 'http://destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmark VALUES(3, 'http://google.com');")

    visit('/bookmarks')

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
  end

end
