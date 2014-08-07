require 'rails_helper'

feature 'Check sleep score' do
  scenario 'Visits dashboard and sees grade' do
    user = create(:user, email: 'user@example.com', password: 'password')
    create(:sleep_session, deep: 480, total: 480, times_woken: 0, user: user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    within('.sleep') do
      grade = user.sleep_score
      expect(grade).to eq 'A'
    end
  end
end
