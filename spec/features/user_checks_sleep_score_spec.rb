require 'rails_helper'

feature 'Check sleep score' do
  scenario 'Visits dashboard and sees grade' do
    user = create(:user)
    create(:sleep_session, deep: 480, total: 480, times_woken: 0, user: user)
    visit dashboard_path(as: user)

    within('.sleep') do
      expect(page).to have_content 'A'
    end
  end
end
