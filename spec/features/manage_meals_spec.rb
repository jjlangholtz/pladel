require 'rails_helper'

feature 'User manages nutrition' do
  scenario 'and adds on diet meals' do
    visit dashboard_path(as: create(:user))

    within('.meals') do
      expect(page).to have_content 'How many meals would you like to add?'
      fill_in :total_meals, with: 3
      expect(page).to have_content 'How many were on diet?'
      fill_in :on_diet, with: 3
      click_button 'Complete meals'
    end

    within('.nutrition') do
      expect(page).to have_content 'A'
    end
  end

  scenario 'and adds off diet meals' do
    visit dashboard_path(as: create(:user))
    fill_in :total_meals, with: 5
    fill_in :on_diet, with: 3
    click_button 'Complete meals'

    within('.nutrition') do
      expect(page).to have_content 'C'
    end
  end
end
