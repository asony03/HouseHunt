class AddHouseStyleToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :house_style, :string
  end
end
