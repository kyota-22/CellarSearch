class RemoveDrinkIdToRestaurants < ActiveRecord::Migration[6.0]
  def change
    remove_column :restaurants, :drink_id, :bigint
  end
end
