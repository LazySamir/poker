feature 'user can see game result' do
  scenario 'user is shown players\' hands, scores and the winner ' do
    visit('/')
    click_button 'Play'
    fill_in :players, with: 2
    fill_in :cards, with: 4
    srand(1)
    click_button 'Play'
    expect(page).to have_content("The winner is Player: 1")
    expect(page).to have_content("Player: 1 Hand: [\"QC\", \"6S\", \"KH\", \"9H\"] Score: 40")
    expect(page).to have_content("Player: 2 Hand: [\"JH\", \"2D\", \"6H\", \"8D\"] Score: 27")
  end
end
