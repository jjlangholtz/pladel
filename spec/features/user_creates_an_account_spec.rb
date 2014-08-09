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

  scenario 'they select the amount of meals they eat per day' do
    visit sign_up_path
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up!'

    expect(page).to have_title 'Food Preferences'

    fill_in :user_meals_per_day, with: 3
    click_button 'Save Preferences'
    click_link 'Continue'

    expect(page).to have_css('li.daily_meal', count: 3)
  end
end
