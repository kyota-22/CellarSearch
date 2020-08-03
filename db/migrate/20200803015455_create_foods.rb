class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :price
      t.string :comment
      t.integer :restaurant_id
      t.timestamps
    end
    add_index :foods, :name
  end
end
