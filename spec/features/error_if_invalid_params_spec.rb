feature 'user can customize game' do
  scenario 'user can enter players and handsize' do
    visit('/')
    click_button 'Play'
    fill_in :players, with: 3
    fill_in :cards, with: 4
    click_button 'Play'
    expect(page).to have_content("Invalid combination of players and handsize")
  end
end
