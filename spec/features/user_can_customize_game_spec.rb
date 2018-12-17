feature 'user can customize game' do
  scenario 'user can enter players and handsize' do
    enter_valid_details
    click_button 'Play'
    expect(page.status_code).to be(200)
  end
end
