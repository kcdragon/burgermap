class AddPostalCodeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :postal_code, :string
  end
end
