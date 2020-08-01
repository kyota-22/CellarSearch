class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :price
      t.string :comment
      t.timestamps
    end
  end
end
