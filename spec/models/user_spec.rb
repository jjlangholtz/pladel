require 'rails_helper'

describe User do
  it 'has a valid vactory' do
    expect(build_stubbed(:user)).to be_valid
  end

  it 'has and belongs to many foods' do
    is_expected.to have_and_belong_to_many(:foods)
  end
end
