require 'rails_helper'

describe DashboardsHelper do
  describe '#composite_percent' do
    it 'converts composite score to a percentage' do
      user = create(:user)
      create(:meal, status: 'complete', user: user)
      create(:meal, status: 'incomplete', user: user)

      expect(composite_percent(user)).to eq 50
    end

    it 'rounds to nearest whole number' do
      user = create(:user)
      create(:meal, status: 'complete', user: user)
      create(:meal, status: 'complete', user: user)
      create(:meal, status: 'incomplete', user: user)

      expect(composite_percent(user)).to eq 67
    end
  end
end
