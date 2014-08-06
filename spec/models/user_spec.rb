require 'rails_helper'

describe User do
  it 'has a valid vactory' do
    expect(build_stubbed(:user)).to be_valid
  end

  it 'has and belongs to many foods' do
    is_expected.to have_and_belong_to_many(:foods)
  end

  it 'has many sleep sessions' do
    is_expected.to have_many(:sleep_sessions)
  end

  describe '#sleep_score' do
    context 'score >= 30' do
      it 'returns a letter grade A' do
        user = create(:user)
        create(:sleep_session, deep: 480, total: 480,
                               times_woken: 0, user: user)

        expect(user.sleep_score).to eq 'A'
      end
    end

    context '18 <= score < 30' do
      it 'returns a letter grade B' do
        user = create(:user)
        create(:sleep_session, deep: 400, total: 480,
                               times_woken: 1, user: user)

        expect(user.sleep_score).to eq 'B'
      end
    end

    context '10 <= score < 18' do
      it 'returns a letter grade C' do
        user = create(:user)
        create(:sleep_session, deep: 480, total: 480,
                               times_woken: 2, user: user)

        expect(user.sleep_score).to eq 'C'
      end
    end

    context '4 <= score < 10' do
      it 'returns a letter grade D' do
        user = create(:user)
        create(:sleep_session, deep: 150, total: 300,
                               times_woken: 1, user: user)

        expect(user.sleep_score).to eq 'D'
      end
    end

    context 'score < 4' do
      it 'returns a letter grade F' do
        user = create(:user)
        create(:sleep_session, deep: 0, total: 0,
                               times_woken: 10, user: user)

        expect(user.sleep_score).to eq 'F'
      end
    end
  end

  describe '#sleep_composite' do
    it 'returns a composite of sleep session scores' do
      user = create(:user)
      create(:sleep_session, deep: 480, total: 480,
                             times_woken: 0, user: user)
      create(:sleep_session, deep: 480, total: 480,
                             times_woken: 0, user: user)

      result = user.sleep_composite

      expect(result).to eq 64
    end
  end
end
