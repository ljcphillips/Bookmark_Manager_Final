feature "Adding a bookmark " do
  scenario "user enters a url to the form and submits it to the list" do
    visit ("/bookmarks")
    fill_in :url, with: "http://google.com"
    fill_in :title, with: "Google"
    click_button "Add bookmark"
    expect(page).to have_content "Google"
    click_link "Google"
    expect(page.current_url).to eq "http://google.com/"
  end

  scenario "User enters no URL to form and hits submit" do
    visit '/bookmarks'
    click_button "Add bookmark"
    expect(page).to have_content "No URL"
  end

  scenario 'User enters an invalid URL and hits submit' do
    visit ("/bookmarks")
    fill_in :url, with: "wazzle.com"
    click_button "Add bookmark"
    expect(page).to have_content "Invalid URL"
  end
end

feature "Deleting bookmarks" do
  scenario "user selects multiple bookmarks and submits." do
    fill_data
    visit ("/bookmarks")
    check('http://google.com')
    check('http://makersacademy.com')
    check('http://destroyallsoftware.com')
    click_button "Delete"
    expect(page).to_not have_content "Makers"
    expect(page).to_not have_content "Google"
    expect(page).to_not have_content "DAS"
  end
end

  feature "Update a bookmark" do
    scenario "user finds a bookmark, updates and submits." do
      fill_data
      visit ("/bookmarks")
      fill_in :search, with: "Google"
      click_button "Submit"
      save_and_open_page
      fill_in :title, with: "Notgoogle"

      click_button "Update"
      expect(page).to have_content "Notgoogle"
    end
  end
