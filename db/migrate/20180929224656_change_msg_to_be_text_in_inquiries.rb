class ChangeMsgToBeTextInInquiries < ActiveRecord::Migration[5.2]
  def change
    change_column :inquiries, :msg, :text
  end
end
