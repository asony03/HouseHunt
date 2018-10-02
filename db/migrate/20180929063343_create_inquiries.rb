class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.references :user
      t.references :house
      t.string :subject
      t.string :msg

      t.timestamps
    end
  end
end
