class Burger < ActiveRecord::Base

  cattr_accessor :categories
  self.categories = ['Cheeseburger', 'Hamburger', 'Veggie Burger']

  belongs_to :restaurant
  has_many :reviews

  validates_uniqueness_of :category, scope: :restaurant_id

  def self.average_ratings
    Burger.select('restaurant_id, burgers.id, AVG(rating) as rating').
           joins(:reviews).
           group(:restaurant_id, 'burgers.id')
  end
end
