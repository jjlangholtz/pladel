require 'rails_helper'

feature 'Check health GPA' do
  context 'with great health' do
    scenario 'and sees A' do
      user = create(:user, email: 'user@example.com', password: 'password')
      create(:sleep_session, deep: 480, total: 480, times_woken: 0, user: user)
      create(:movement_session, distance: 20000, calories_burned: 1400, user: user)
      create(:meal, status: 'complete', user: user)

      visit root_path
      click_link 'Sign in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign in'

      within('.health') do
        expect(page).to have_content 'A'
      end
    end
  end

  context 'with poor health' do
    scenario 'and sees F' do
      user = create(:user, email: 'user@example.com', password: 'password')
      create(:sleep_session, deep: 50, total: 100, times_woken: 10, user: user)
      create(:movement_session, distance: 100, calories_burned: 10, user: user)
      create(:meal, status: 'incomplete', user: user)

      visit root_path
      click_link 'Sign in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign in'

      within('.health') do
        expect(page).to have_content 'F'
      end
    end
  end
end
