require 'rails_helper'

describe SleepSession do
  it 'has a valid factory' do
    expect(build_stubbed(:sleep_session)).to be_valid
  end

  it 'belongs to a user' do
    is_expected.to belong_to(:user)
  end

  it 'has a unique timestamp' do
    is_expected.to validate_uniqueness_of(:timestamp).scoped_to(:user_id)
  end

  describe '#score' do
    context 'given a perfect sleep session' do
      it 'returns a score for the sleep session' do
        sleep_session = create(:sleep_session, deep: 480, total: 480, times_woken: 0)

        expect(sleep_session.score).to eq 64
      end
    end

    context 'given a horrible sleep session' do
      it 'returns a score for the sleep session' do
        sleep_session = create(:sleep_session, deep: 240, total: 240, times_woken: 3)

        expect(sleep_session.score).to eq 4
      end
    end
  end
end
