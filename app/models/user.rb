class User < ApplicationRecord
  belongs_to :real_estate_company
  has_many :houses # realtor is associated with houses
  has_many :inquiries
  has_many :potential_buyers

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, allow_nil: true


  ROLE_HOUSE_HUNTER = 1
  ROLE_REALTOR = 2
  ROLE_ADMIN = 3

  def role
    if is_admin?
      ROLE_ADMIN
    elsif is_realtor?
      ROLE_REALTOR
    else
      ROLE_HOUSE_HUNTER
    end
  end
end
