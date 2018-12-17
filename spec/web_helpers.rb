def enter_valid_details
  visit('/')
  click_button 'Play'
  fill_in :players, with: 2
  fill_in :cards, with: 4
end
