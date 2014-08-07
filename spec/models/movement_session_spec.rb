require 'rails_helper'

describe MovementSession do
  it 'has a valid factory' do
    expect(build_stubbed(:movement_session)).to be_valid
  end

  it 'belongs to a user' do
    is_expected.to belong_to(:user)
  end

  describe '#score' do
    context 'given a heavy movement session' do
      it 'returns a score for the session' do
        movement_session = create(:movement_session, distance: 20000, calories_burned: 1400)

        expect(movement_session.score).to eq 5303
      end
    end

    context 'given a light movement session' do
      it 'returns a score for the session' do
        movement_session = create(:movement_session, distance: 5280, calories_burned: 500)

        expect(movement_session.score).to eq 500
      end
    end
  end
end
