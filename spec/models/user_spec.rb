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

  it 'has many movement sessions' do
    is_expected.to have_many(:movement_sessions)
  end

  it 'has many meals' do
    is_expected.to have_many(:meals)
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

  describe '#movement_score' do
    context 'score >= 5000' do
      it 'returns a letter grade A' do
        user = create(:user)
        create(:movement_session, distance: 13200, calories_burned: 2000, user: user)

        expect(user.movement_score).to eq 'A'
      end
    end

    context '3000 <= score < 5000' do
      it 'returns a letter grade B' do
        user = create(:user)
        create(:movement_session, distance: 5280, calories_burned: 3000, user: user)

        expect(user.movement_score).to eq 'B'
      end
    end

    context '1500 <= score < 3000' do
      it 'returns a letter grade C' do
        user = create(:user)
        create(:movement_session, distance: 5280, calories_burned: 1500, user: user)

        expect(user.movement_score).to eq 'C'
      end
    end

    context '800 <= score < 1500' do
      it 'returns a letter grade D' do
        user = create(:user)
        create(:movement_session, distance: 5280, calories_burned: 800, user: user)

        expect(user.movement_score).to eq 'D'
      end
    end

    context 'score < 800' do
      it 'returns a letter grade F' do
        user = create(:user)
        create(:movement_session, distance: 5280, calories_burned: 799, user: user)

        expect(user.movement_score).to eq 'F'
      end
    end
  end

  describe '#movement_composite' do
    it 'returns a composite of movement session scores' do
      user = create(:user)
      create(:movement_session, distance: 20000, calories_burned: 1400, user: user)
      create(:movement_session, distance: 5280, calories_burned: 500, user: user)

      result = user.movement_composite

      expect(result).to eq 2901.5
    end
  end

  describe '#nutrition_score' do
    context 'score >= 0.8' do
      it 'returns a letter grade A' do
        user = create(:user)
        allow(user).to receive(:complete_meals).and_return(4)
        allow(user).to receive(:total_meals).and_return(5)

        expect(user.nutrition_score).to eq 'A'
      end
    end

    context '0.7 <= score < 0.8' do
      it 'returns a letter grade B' do
        user = create(:user)
        allow(user).to receive(:complete_meals).and_return(7)
        allow(user).to receive(:total_meals).and_return(10)

        expect(user.nutrition_score).to eq 'B'
      end
    end

    context '0.6 <= score < 0.7' do
      it 'returns a letter grade C' do
        user = create(:user)
        allow(user).to receive(:complete_meals).and_return(3)
        allow(user).to receive(:total_meals).and_return(5)

        expect(user.nutrition_score).to eq 'C'
      end
    end

    context '0.5 <= score < 0.6' do
      it 'returns a letter grade D' do
        user = create(:user)
        allow(user).to receive(:complete_meals).and_return(1)
        allow(user).to receive(:total_meals).and_return(2)

        expect(user.nutrition_score).to eq 'D'
      end
    end

    context 'score < 0.5' do
      it 'returns a letter grade F' do
        user = create(:user)
        allow(user).to receive(:complete_meals).and_return(2)
        allow(user).to receive(:total_meals).and_return(5)

        expect(user.nutrition_score).to eq 'F'
      end
    end
  end

  describe '#nutrition_composite' do
    it 'returns the percent of total meals completed' do
      user = create(:user)
      create(:meal, status: 'complete', user: user)
      create(:meal, status: 'incomplete', user: user)

      expect(user.nutrition_composite).to eq 0.5
    end
  end

  describe '#total_meals' do
    it 'returns the count of complete and incomplete meals' do
      user = create(:user)
      create(:meal, status: 'complete', user: user)
      create(:meal, status: 'incomplete', user: user)

      expect(user.total_meals).to eq 2
    end
  end

  describe '#complete_meals' do
    it 'returns the count of complete' do
      user = create(:user)
      create(:meal, status: 'complete', user: user)
      create(:meal, status: 'incomplete', user: user)

      expect(user.complete_meals).to eq 1
    end
  end

  describe '#health_gpa' do
    context 'score >= 3.3' do
      it 'returns a letter grade A' do
        user = create(:user)
        allow(user).to receive(:nutrition_score).and_return('A')
        allow(user).to receive(:sleep_score).and_return('A')
        allow(user).to receive(:movement_score).and_return('A')

        expect(user.health_gpa).to eq 'A'
      end
    end

    context '2.7 <= score < 3.3' do
      it 'returns a letter grade B' do
        user = create(:user)
        allow(user).to receive(:nutrition_score).and_return('B')
        allow(user).to receive(:sleep_score).and_return('B')
        allow(user).to receive(:movement_score).and_return('B')

        expect(user.health_gpa).to eq 'B'
      end
    end

    context '2.0 <= score < 2.7' do
      it 'returns a letter grade C' do
        user = create(:user)
        allow(user).to receive(:nutrition_score).and_return('C')
        allow(user).to receive(:sleep_score).and_return('C')
        allow(user).to receive(:movement_score).and_return('C')

        expect(user.health_gpa).to eq 'C'
      end
    end

    context '1.0 <= score < 2.0' do
      it 'returns a letter grade D' do
        user = create(:user)
        allow(user).to receive(:nutrition_score).and_return('D')
        allow(user).to receive(:sleep_score).and_return('D')
        allow(user).to receive(:movement_score).and_return('D')

        expect(user.health_gpa).to eq 'D'
      end
    end

    context 'score < 1.0' do
      it 'returns a letter grade F' do
        user = create(:user)
        allow(user).to receive(:nutrition_score).and_return('F')
        allow(user).to receive(:sleep_score).and_return('F')
        allow(user).to receive(:movement_score).and_return('F')

        expect(user.health_gpa).to eq 'F'
      end
    end
  end

  describe '#nutrition_score_to_gpa' do
    it 'converts gpa to an integer' do
      user = create(:user)
      allow(user).to receive(:nutrition_score).and_return('A')

      expect(user.nutrition_score_to_gpa).to eq 4.0
    end
  end

  describe '#movement_score_to_gpa' do
    it 'converts gpa to an integer' do
      user = create(:user)
      allow(user).to receive(:movement_score).and_return('A')

      expect(user.movement_score_to_gpa).to eq 4.0
    end
  end

  describe '#sleep_score_to_gpa' do
    it 'converts gpa to an integer' do
      user = create(:user)
      allow(user).to receive(:sleep_score).and_return('A')

      expect(user.sleep_score_to_gpa).to eq 4.0
    end
  end
end
