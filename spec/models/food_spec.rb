require 'rails_helper'

describe Food do
  it 'has a valid factory' do
    expect(build_stubbed(:food)).to be_valid
  end

  it 'have and belong to many users' do
    is_expected.to have_and_belong_to_many(:users)
  end
end
