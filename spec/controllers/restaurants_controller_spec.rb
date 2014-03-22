require 'spec_helper'

describe RestaurantsController do

  describe "GET 'index'" do
    it 'assign empty restaurants if not searching' do
      Restaurant::SearchQuery.should_not_receive(:new)
      get 'index'
    end

    xit 'uses request location if no location is specified' do
      latitude = double
      longitude = double
      request.location.stub(latitude: latitude,
                            longitude: longitude)

      search_query = double
      Restaurant::SearchQuery.should_receive(:new).with(nil, [latitude, longitude], kind_of(Hash)).and_return(search_query)
      search_query.should_receive(:all)

      get 'index', q: nil, location: nil
    end
  end

end
