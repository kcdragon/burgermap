require 'spec_helper'

describe Review do

  describe '#valid?' do
    it 'invalid if rating is less than 1' do
      review = build(:review, rating: 0)
      expect(review).to_not be_valid
    end

    it 'invalid if rating is greater than 5' do
      review = build(:review, rating: 6)
      expect(review).to_not be_valid
    end
  end
end
