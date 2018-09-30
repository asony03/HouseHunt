class ChangeContactToBeStringInHouses < ActiveRecord::Migration[5.2]
  def change
    change_column :houses, :contact, :string
  end
end
