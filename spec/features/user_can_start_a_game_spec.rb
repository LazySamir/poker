feature 'user can play poker' do
  scenario 'user can play poker' do
    visit('/')
    click_button 'Play'
    fill_in :players, with: 2
    fill_in :cards, with: 4
    click_button 'Play'
    expect(page.status_code).to be(200)
  end
end
