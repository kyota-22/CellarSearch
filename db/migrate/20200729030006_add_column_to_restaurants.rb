class AddColumnToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :addres, :string
    add_column :restaurants, :station, :string
    add_column :restaurants, :tel, :string
    add_column :restaurants, :image, :string
    add_column :restaurants, :comment, :string
  end
end
