class AddRestaurantIdToDrink < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks, :restaurant_id, :integer
  end
end
