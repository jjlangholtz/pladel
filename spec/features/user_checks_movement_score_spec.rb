require 'rails_helper'

feature 'Check movement score' do
  scenario 'Visits dashboard and sees grade' do
    user = create(:user, email: 'user@example.com', password: 'password')
    create(:movement_session, distance: 20000, calories_burned: 1400, user: user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    within('.movement') do
      expect(page).to have_content 'A'
    end
  end
end
