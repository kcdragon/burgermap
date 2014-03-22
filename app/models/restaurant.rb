class Restaurant < ActiveRecord::Base

  has_many :burgers

  geocoded_by :address
  after_validation :geocode, if: -> do
    address_changed? &&
      !(latitude_changed? && longitude_changed?)
  end

  validates_presence_of :name, :address

  #def self.search(query, location, options = {})
  #  Restaurant::SearchQuery.new(query, location, options).all
  #end
end
