require 'rails_helper'

feature 'User manages nutrition' do
  scenario 'and a new user sees one active meals on dashboard' do
    user = create(:user)
    user.create_active_meals(1)
    visit dashboard_path(as: user)

    expect(page).to have_css('.daily_meal', count: 1)
  end

  pending 'and adds a new meal by completing a previous meal' do
    user = create(:user)
    user.create_active_meals(1)
    visit dashboard_path(as: user)

    click_link '✓'

    expect(page).to have_css('.daily_meal', count: 2)
  end

  pending 'and sees a maximum of three meals' do
    user = create(:user)
    user.create_active_meals(4)
    visit dashboard_path(as: user)

    expect(page).to have_css('.daily_meal', count: 3)
  end

  scenario 'and clicks to complete a meal' do
    user = create(:user)
    create(:meal, status: 'active', user: user)
    visit dashboard_path(as: user)

    click_link '✓'

    within('.nutrition') do
      expect(page).to have_content 'A'
    end
  end

  pending 'and clicks to mark a meal incomplete' do
    user = create(:user)
    create(:meal, status: 'active', user: user)
    create(:meal, status: 'active', user: user)
    visit dashboard_path(as: user)

    click_link 'X'

    within('.nutrition') do
      expect(page).to have_content 'F'
    end
  end
end
