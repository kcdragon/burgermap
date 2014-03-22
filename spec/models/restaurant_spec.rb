require 'spec_helper'

describe Restaurant do

  describe '#valid?' do
    it 'false if name is not present' do
      subject = build(:restaurant)
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'false if address is not present' do
      subject = build(:restaurant)
      subject.address = nil
      expect(subject).to_not be_valid
    end
  end

  describe '#geocode' do
    it 'does not geocode if address has not changed' do
      restaurant = create(:restaurant)
      restaurant.should_not_receive(:geocode)
      restaurant.save
    end

    it 'does not geocode if lat/long is supplied' do
      restaurant = build(:restaurant)
      restaurant.latitude = 1.0
      restaurant.longitude = 1.0

      restaurant.should_not_receive(:geocode)
      restaurant.save
    end
  end
end
