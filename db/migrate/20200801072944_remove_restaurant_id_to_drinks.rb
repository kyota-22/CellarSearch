class RemoveRestaurantIdToDrinks < ActiveRecord::Migration[6.0]
  def change
    remove_column :drinks, :restaurant_id, :integer
  end
end
