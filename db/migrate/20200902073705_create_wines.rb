class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :price
      t.string :comment
      t.string :color
      t.string :area
      t.string :variety
      t.integer :restaurant_id
      t.timestamps
    end
    add_index :wines, :name
    add_index :wines, :color
    add_index :wines, :area
    add_index :wines, :variety
  end
end
