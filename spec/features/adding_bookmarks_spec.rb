

feature "Adding a bookmark " do
  scenario "user enters a url to the form and submits it to the list" do
    visit "/bookmarks"
    fill_in :url, with: "http://google.com"
    click_button "Add bookmark"
    expect(page).to have_content "http://google.com"
  end
end
