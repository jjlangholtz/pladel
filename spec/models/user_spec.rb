require 'rails_helper'

describe User do
  it 'has a valid vactory' do
    expect(build_stubbed(:user)).to be_valid
  end
end
