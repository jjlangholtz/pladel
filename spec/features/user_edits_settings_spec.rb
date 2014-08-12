require 'rails_helper'

feature 'User edits settings' do
  scenario 'adds food preferences' do
    visit dashboard_path(as: create(:user))
    create(:food, name: 'Banana', group: 'fruits')

    click_link 'Settings'

    expect(page).to have_title 'Settings'

    check 'Banana'
    click_button 'Save Preferences'

    expect(page).to have_title 'Devices'
  end
end
