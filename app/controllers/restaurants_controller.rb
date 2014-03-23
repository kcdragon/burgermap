class RestaurantsController < ApplicationController
  helper_method :location

  def index
    if params.key?(:q)
      @restaurants = Restaurant::SearchQuery.new(params[:q], location, page: params[:page], sort: params[:sort]).all
    else
      @restaurants = Kaminari.paginate_array([]).page(1).per(10)
    end

    @restaurants = RestaurantsDecorator.new(@restaurants)
  end

  private

  def location
    return params[:location] if params[:location].present?

    if Rails.env.development? || Rails.env.test?
      return [39.950585, -75.145798]
    end

    location = request.location
    if location
      [location.latitude, location.longitude]
    end
  end
end
