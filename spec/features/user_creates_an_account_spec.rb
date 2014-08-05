require 'rails_helper'

feature 'User signs up for an account' do
  scenario 'they visit the sign-up page' do
    visit sign_up_path

    expect(page).to have_title 'Sign Up'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'

    expect(page).to have_title 'Food Preferences'

    check 'Apple'
    click_button 'Save Preferences'

    expect(page).to have_title 'Devices'

    select 'Fitbit', from: 'Devices'
    fill_in 'Key', with: '12345'
    click_button 'Save Devices'

    expect(page).to have_title 'Dashboard'
  end
end
