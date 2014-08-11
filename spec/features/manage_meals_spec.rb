require 'rails_helper'

feature 'User manages nutrition' do
  scenario 'and adds a new meal' do
    visit dashboard_path(as: create(:user))
    click_button 'Add meal'

    expect(page).to have_css('.daily_meal', count: 1)
  end

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
