feature 'user can customize game' do
  scenario 'user can enter players and handsize' do
    visit('/')
    click_button 'Play'
    fill_in :players, with: 2
    fill_in :cards, with: 4
    click_button 'Play'
    expect(page.status_code).to be(200)
  end
end
