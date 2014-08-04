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

    expect(page).to have_content 'Signed in as: user@example.com'
    expect(page).to have_title 'Dashboard'
  end
end
