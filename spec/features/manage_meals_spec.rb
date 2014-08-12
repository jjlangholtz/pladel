require 'rails_helper'

feature 'User manages nutrition' do
  scenario 'and a new user sees three active meals on dashboard' do
    user = create(:user)
    user.create_active_meals(3)
    visit dashboard_path(as: user)

    expect(page).to have_css('.daily_meal', count: 3)
  end

  scenario 'and adds a new meal by completing a previous meal' do
    user = create(:user)
    user.create_active_meals(3)
    visit dashboard_path(as: user)

    click_button 'Finish meal 3'

    expect(page).to have_css('.daily_meal', count: 3)
  end

  scenario 'and sees a maximum of three meals' do
    user = create(:user)
    user.create_active_meals(4)
    visit dashboard_path(as: user)

    expect(page).to have_css('.daily_meal', count: 3)
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

  scenario 'and clicks to mark a meal incomplete' do
    user = create(:user)
    create(:meal, status: 'active', user: user)
    visit dashboard_path(as: user)

    click_button 'Did not finish'

    within('.nutrition') do
      expect(page).to have_content 'F'
    end
  end
end
