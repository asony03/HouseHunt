class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :preferred_cnt_menthod
      t.boolean :is_admin
      t.boolean :is_realtor
      t.boolean :is_house_hunter
      t.references :RealEstateCompany, foreign_key: true

      t.timestamps
    end
  end
end
