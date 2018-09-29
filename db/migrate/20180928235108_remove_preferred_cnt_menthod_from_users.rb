class RemovePreferredCntMenthodFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :preferred_cnt_menthod, :string
  end
end
