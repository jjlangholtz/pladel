require 'rails_helper'

describe Meal do
  it 'has a valid factory' do
    expect(build_stubbed(:meal)).to be_valid
  end

  it 'belongs to a user' do
    is_expected.to belong_to(:user)
  end
end
