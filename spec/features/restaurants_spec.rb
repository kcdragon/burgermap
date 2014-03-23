require 'spec_helper'

feature 'restaurants' do

  scenario 'searching by name' do
    restaurant = create(:restaurant_with_burger)

    visit restaurants_path

    within '#search-form' do
      fill_in 'q', with: 'test'
      click_button 'search'
    end

    page.should have_content '1 result'
    page.should have_content restaurant.name
    page.should have_content 'Cheeseburger'
  end

  scenario 'searching by location' do
    university_city_restaurant = create(:university_city_restaurant)
    old_city_restaurant = create(:old_city_restaurant)

    visit restaurants_path

    within '#search-form' do
      fill_in 'location', with: 'Old City, Philadelphia, PA'
      click_button 'search'
    end

    page.should have_content /#{old_city_restaurant.name}.*#{university_city_restaurant.name}/
  end

  scenario 'pagination' do
    Restaurant::SearchQuery.stub(per_page: 1)

    university_city_restaurant = create(:university_city_restaurant)
    old_city_restaurant = create(:old_city_restaurant)

    visit restaurants_path

    within '#search-form' do
      fill_in 'location', with: 'Old City, Philadelphia, PA'
      click_button 'search'
    end

    page.should     have_content old_city_restaurant.name
    page.should_not have_content university_city_restaurant.name

    find('.arrow a[rel=next]').click
    page.should_not have_content old_city_restaurant.name
    page.should     have_content university_city_restaurant.name
  end
end
