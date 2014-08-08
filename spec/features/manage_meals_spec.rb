require 'rails_helper'

feature 'User manages nutrition' do
  scenario 'and adds number of meals' do
    visit dashboard_index_path(as: create(:user))
  end
end
