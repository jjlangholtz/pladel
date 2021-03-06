require 'rails_helper'

describe MovementSession do
  it 'has a valid factory' do
    expect(build_stubbed(:movement_session)).to be_valid
  end

  it 'belongs to a user' do
    is_expected.to belong_to(:user)
  end

  it 'has a unique timestamp' do
    is_expected.to validate_uniqueness_of(:timestamp).scoped_to(:user_id)
  end

  it 'has steps greater than zero' do
    is_expected.to validate_numericality_of(:steps).is_greater_than(0)
  end
end
