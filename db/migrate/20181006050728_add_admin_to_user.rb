class AddAdminToUser < ActiveRecord::Migration[5.2]
  def self.up
    User.create :name => "backup", :email => "admin2@example.com", :password_digest => "$2a$10$R/RcTJmXjTM/d11/Chitjuo0zSvjd.esxcqzGUbDGw6NQ.DDoYdvS", :is_admin => 1
  end

  def self.down
    User.delete_all
  end
end
