require 'rails_helper'

feature 'Check nutrition score' do
  context 'with great nutrition' do
    scenario 'and sees A' do
      user = create(:user)
      create(:meal, status: 'complete', user: user)
      visit dashboard_path(as: user)

      within('.nutrition') do
        expect(page).to have_css('p.nutrition_progress')
        expect(page).to have_content 'A'
      end
    end
  end
end
