class RestaurantsDecorator

  attr_reader :restaurants

  def initialize(restaurants)
    @restaurants = restaurants
  end

  def start
    restaurants.first_page? ? 1 : Restaurant::SearchQuery.per_page * (restaurants.current_page - 1) + 1
  end

  def to_json
    restaurants.to_json
  end

  def method_missing(method, *args, &block)
    if restaurants.respond_to?(method, *args, &block)
      restaurants.send(method, *args, &block)
    else
      super
    end
  end

  def respond_to?(method, *args, &block)
    restaurants.respond_to?(method, *args, &block) || super
  end
end
