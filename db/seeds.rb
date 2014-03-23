User.create(email: 'foo@bar.com',
            password: 'password',
            password_confirmation: 'password')

20.times do |i|
  latitude = 39.9 + (1.0 / (rand(100) - 50))
  longitude = -75.1 + (1.0 / (rand(100) - 50))
  restaurant = Restaurant.create!(name: "Test Restaurant #{i}",
                                  address: i.to_s,
                                  latitude: latitude,
                                  longitude: longitude)

  categories_used = Set.new

  num_burgers = rand(2)
  (0..num_burgers).map do
    category = (Burger.categories - categories_used.to_a).sample
    burger = restaurant.burgers.build(category: category)

    categories_used << category

    2.times do
      rating = rand(5) + 1
      burger.reviews.build(rating: rating)
    end
  end

  restaurant.save!
end
