class AddIndexRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_index :restaurants, [:name, :addres, :station]
  end
end
