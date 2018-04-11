feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    fill_data
    visit('/bookmarks')

    expect(page).to have_content "http://makersacademy.com"
    expect(page).to have_content "http://destroyallsoftware.com"
    expect(page).to have_content "http://google.com"
  end

end
