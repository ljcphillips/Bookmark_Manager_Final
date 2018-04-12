feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    fill_data
    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_content "DAS"
    expect(page).to have_content "Google"
  end

end
