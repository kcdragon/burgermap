require 'spec_helper'

describe Restaurant::SearchQuery do

  describe '#all' do
    let(:query) { nil }
    let(:location) { nil }
    let(:options) { {} }

    subject { Restaurant::SearchQuery.new(query, location, options) }

    let(:results) { subject.all }

    context 'when searching by query' do
      let(:query) { 'test' }

      it 'searches by name' do
        restaurant = create(:restaurant)
        expect(results).to include restaurant
      end
    end

    context 'when searching by location' do
      let(:location) { 'Old City, Philadelphia, PA' }

      it 'sorts by location' do
        university_city_restaurant = create(:university_city_restaurant)
        old_city_restaurant = create(:old_city_restaurant)

        expect(results).to eq [old_city_restaurant, university_city_restaurant]
      end
    end

    context 'when sorting' do
      let(:query) { 'test' }
      let(:options) { { sort: 'rating' } }

      it 'sorts by rating' do
        worst = create(:restaurant)
        burger = worst.burgers.build(category: 'Cheeseburger')
        burger.reviews.build(rating: 1)
        burger.save!

        best = create(:restaurant)
        burger = best.burgers.build(category: 'Cheeseburger')
        burger.reviews.build(rating: 5)
        burger.save!

        expect(results).to eq [best, worst]
      end
    end

    context 'when searching and sorting' do
      let(:query) { 'city' }
      let(:location) { 'Old City, Philadelphia, PA' }

      it 'search and sorts' do
        restaurant = create(:restaurant)
        university_city_restaurant = create(:university_city_restaurant)
        old_city_restaurant = create(:old_city_restaurant)

        expect(results).to eq [old_city_restaurant, university_city_restaurant]
      end

      context 'when sort is rating and location' do
        let(:options) { { sort: 'rating' } }

        it 'sorts by rating' do
          university_city_restaurant = create(:university_city_restaurant)

          old_city_restaurant = create(:old_city_restaurant)
          burger = old_city_restaurant.burgers.first
          review = burger.reviews.first
          review.rating = 1
          review.save!

          expect(results).to eq [university_city_restaurant, old_city_restaurant]
        end
      end
    end
  end
end
