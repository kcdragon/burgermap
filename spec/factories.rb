FactoryGirl.define do
  factory :restaurant do
    name 'Test Restaurant'
    address 'Old City, Philadelphia, PA'
    postal_code '19106'

    factory :restaurant_with_burger do
      after(:create) do |restaurant, evaluator|
        create_list(:burger_with_reivew, 1, restaurant: restaurant, category: 'Cheeseburger')
      end

      factory :old_city_restaurant do
        name 'Old City Restaurant'
      end

      factory :university_city_restaurant do
        name 'University City Restaurant'
        address 'University City, Philadelphia, PA'
        postal_code '19104'
      end
    end
  end

  factory :burger do
    category 'Cheeseburger'

    factory :burger_with_reivew do
      after(:create) do |burger, evaluator|
        create_list(:review, 1, burger: burger, rating: 5)
      end
    end
  end

  factory :review do
    burger_id 1
    rating 5
  end
end
