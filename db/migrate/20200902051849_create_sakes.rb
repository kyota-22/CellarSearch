class CreateSakes < ActiveRecord::Migration[6.0]
  def change
    create_table :sakes do |t|
      t.string :name
      t.string :price
      t.string :comment
      t.string :prefecture
      t.integer :restaurant_id
      t.timestamps
    end
    add_index :sakes, :name
    add_index :sakes, :prefecture
  end
end
