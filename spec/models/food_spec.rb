require 'rails_helper'

describe Food do
  it 'has a valid factory' do
    expect(build_stubbed(:food)).to be_valid
  end

  it 'have and belong to many users' do
    is_expected.to have_and_belong_to_many(:users)
  end

  context 'scopes' do
    describe '.vegetables' do
      it 'returns an array of vegetables' do
        carrot = create(:food, group: 'vegetable')
        avocado = create(:food, group: 'vegetable')

        expect(Food.vegetables).to include(carrot, avocado)
      end
    end

    describe '.fish' do
      it 'returns an array of fish' do
        cod = create(:food, group: 'fish')
        eel = create(:food, group: 'fish')

        expect(Food.fish).to include(cod, eel)
      end
    end

    describe '.meat' do
      it 'returns an array of meat' do
        shrimp = create(:food, group: 'meat')
        chicken = create(:food, group: 'meat')

        expect(Food.meat).to include(shrimp, chicken)
      end
    end

    describe '.nuts' do
      it 'returns an array of nuts' do
        pecans = create(:food, group: 'nuts')
        walnuts = create(:food, group: 'nuts')

        expect(Food.nuts).to include(pecans, walnuts)
      end
    end

    describe '.fats' do
      it 'returns an array of fats' do
        butter = create(:food, group: 'fats')
        lard = create(:food, group: 'fats')

        expect(Food.fats).to include(butter, lard)
      end
    end

    describe '.spices' do
      it 'returns an array of spices' do
        sage = create(:food, group: 'spices')
        thyme = create(:food, group: 'spices')

        expect(Food.spices).to include(sage, thyme)
      end
    end
  end
end
