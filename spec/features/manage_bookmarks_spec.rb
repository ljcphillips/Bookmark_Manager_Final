feature "Adding a bookmark " do
  scenario "user enters a url to the form and submits it to the list" do
    visit ("/bookmarks")
    fill_in :url, with: "http://google.com"
    click_button "Add bookmark"
    expect(page).to have_content "http://google.com"
  end
end

feature "Deleting bookmarks" do
  scenario "user selects multiple bookmarks and submits." do
    fill_data
    visit ("/bookmarks")
    check('http://google.com')
    check('http://makersacademy.com')
    click_button "Delete"
    expect(page).to_not have_content "http://makersacademy.com"
    expect(page).to_not have_content "http://google.com"
  end
end
