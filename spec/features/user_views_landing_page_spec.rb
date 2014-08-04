require 'rails_helper'

feature 'User views landing page' do
  scenario 'they see the title on the page' do
    visit '/'

    expect(page).to have_title 'Pladel'
  end
end
