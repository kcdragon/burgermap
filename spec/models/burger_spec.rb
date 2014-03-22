require 'spec_helper'

describe Burger do

  describe '.average_ratings' do
    it 'returns average rating for multiple burgers' do
      burger = create(:burger, restaurant_id: 1, reviews: [Review.new(rating: 2), Review.new(rating: 4)])

      results = Burger.average_ratings
      expect(results).to be_one

      result = results.first
      expect(result.id).to eq burger.id
      expect(result.restaurant_id).to eq 1
      expect(result.rating).to eq 3
    end
  end

  describe '#valid?' do
    it 'invalid if category is not unique at restaurant level' do
      restaurant = create(:restaurant)

      create(:burger,
             restaurant: restaurant,
             category: 'Cheeseburger')

      burger = build(:burger,
                     restaurant: restaurant,
                     category: 'Cheeseburger')

      expect(burger).to_not be_valid
    end

    it 'valid if category is not unique globally' do
      restaurant_one = create(:restaurant)
      restaurant_two = create(:restaurant)

      create(:burger,
             restaurant: restaurant_one,
             category: 'Cheeseburger')

      burger = build(:burger,
                     restaurant: restaurant_two,
                     category: 'Cheeseburger')

      expect(burger).to be_valid
    end
  end
end
