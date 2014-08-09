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

  scenario 'changes the meals per day' do
    visit dashboard_path(as: create(:user))
    click_link 'Settings'

    fill_in :user_meals_per_day, with: 5
    click_button 'Save Preferences'
    click_link 'Continue'

    expect(page).to have_css('li.daily_meal', count: 5)
  end
end
