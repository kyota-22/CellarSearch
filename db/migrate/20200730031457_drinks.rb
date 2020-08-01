class Drinks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :drinks, :restaurants, column: :restaurant_id
    t.timestamps
  end
end
