require 'rails_helper'

feature 'Check health GPA' do
  context 'with great health' do
    scenario 'and sees A' do
      user = create(:user)
      create(:sleep_session, deep: 480, total: 480, times_woken: 0, user: user)
      create(:movement_session, steps: 20000, user: user)
      create(:meal, status: 'complete', user: user)
      visit dashboard_path(as: user)

      within('.health') do
        expect(page).to have_content 'A'
      end
    end
  end

  context 'with poor health' do
    scenario 'and sees F' do
      user = create(:user)
      create(:sleep_session, deep: 50, total: 100, times_woken: 10, user: user)
      create(:movement_session, steps: 100, user: user)
      create(:meal, status: 'incomplete', user: user)
      visit dashboard_path(as: user)

      within('.health') do
        expect(page).to have_content 'F'
      end
    end
  end
end
