require 'rails_helper'

feature 'User signs up for an account' do
  scenario 'they visit the sign-up page and create an account' do
    create(:food, name: 'apple', group: 'fruits')

    visit sign_up_path

    expect(page).to have_title 'Sign Up'

    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up!'

    expect(page).to have_title 'Food Preferences'

    check 'apple'
    click_button 'Save Preferences'

    expect(page).to have_title 'Devices'

    click_link 'Continue'

    expect(page).to have_title 'Dashboard'
  end
end
