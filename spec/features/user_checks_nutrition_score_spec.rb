require 'rails_helper'

feature 'Check nutrition score' do
  scenario 'Visits dashboard and sees grade' do
    user = create(:user, email: 'user@example.com', password: 'password')
    create(:meal, status: 'complete', user: user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    within('.nutrition') do
      grade = user.nutrition_score
      expect(grade).to eq 'A'
    end
  end
end
