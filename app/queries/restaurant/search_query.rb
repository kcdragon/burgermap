class Restaurant::SearchQuery

  cattr_accessor :per_page
  self.per_page = 5

  attr_reader :query, :location, :options

  def initialize(query, location, options = {})
    @query, @location, @options = query, location, options
  end

  def all
    results = Restaurant.includes(:burgers)

    if location.present?
      results = results.near(location, 50, order: 'distance')
    end

    if query.present?
      wildcard_query = "%#{query}%"
      results = results.where('name ILIKE ?', wildcard_query)
    end

    results = results.select('restaurants.*, AVG(burger_ratings.rating) AS rating').
                      joins("LEFT JOIN (#{burger_ratings.to_sql}) AS burger_ratings
                             ON burger_ratings.restaurant_id = restaurants.id").
                      group('restaurants.id')


    if options[:sort] == 'rating'
      results = results.order('rating DESC')
    end

    results.page(page).per(self.class.per_page)
  end

  private

  def burger_ratings
    Burger.average_ratings
  end

  def page
    (options[:page] || 1).to_i
  end
end
