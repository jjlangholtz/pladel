require 'rails_helper'

feature 'User edits settings' do
  scenario 'adds food preferences' do
    create(:user, email: 'user@example.com', password: 'password')
    create(:food, name: 'Banana', group: 'fruit')

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    click_link 'Settings'

    expect(page).to have_title 'Settings'

    check 'Banana'
    click_button 'Save Preferences'

    expect(page).to have_title 'Devices'
  end
end
