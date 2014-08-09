require 'rails_helper'

feature 'User manages nutrition' do
  scenario 'and clicks to complete a meal' do
    user = create(:user)
    create(:meal, status: 'active', user: user)
    visit dashboard_path(as: user)

    click_button 'Finish meal'

    within('.nutrition') do
      expect(page).to have_content 'A'
    end
  end
end
