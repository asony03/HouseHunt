class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.references :real_estate_company
      t.references :user
      t.references :house_style
      t.string :location
      t.integer :sq_ft
      t.integer :year
      t.integer :price
      t.integer :floors
      t.boolean :basement
      t.string :owner
      t.integer :contact
      t.string :potential_buyers

      t.timestamps
    end
  end
end
