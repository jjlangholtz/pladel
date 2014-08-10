require 'rails_helper'

feature 'Check movement score' do
  scenario 'Visits dashboard and sees grade' do
    user = create(:user)
    create(:movement_session, steps: 20000, user: user)
    visit dashboard_path(as: user)

    within('.movement') do
      expect(page).to have_css('p.movement_progress')
      expect(page).to have_content 'A'
    end
  end
end
