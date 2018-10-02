class RemoveHouseStyleFromHouses < ActiveRecord::Migration[5.2]
  def change
    remove_reference :houses, :house_style, index:true
  end
end
