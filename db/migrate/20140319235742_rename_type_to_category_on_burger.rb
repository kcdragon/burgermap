class RenameTypeToCategoryOnBurger < ActiveRecord::Migration
  def change
    rename_column :burgers, :type, :category
  end
end
