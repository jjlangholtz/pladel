require 'rails_helper'

feature 'User views landing page' do
  scenario 'they see the title on the page' do
    visit root_path

    expect(page).to have_title 'Pladel'
  end

  scenario 'they can sign-in and view a dashboard' do
    create(:user, email: 'user@example.com', password: 'password')

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_title 'Dashboard'
    expect(page).not_to have_link 'Sign in'
  end

  scenario 'they can view static pages' do
    visit root_path
    click_link 'About'

    expect(page).to have_title 'About'

    visit root_path
    click_link 'Team'

    expect(page).to have_title 'Team'
  end

  scenario 'they see static pages in navbar while signed in' do
    visit root_path(as: create(:user))

    within('nav') do
      expect(page).to have_content 'About'
      expect(page).to have_content 'Team'
    end
  end
end
