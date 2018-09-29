class House < ApplicationRecord
  belongs_to :real_estate_company
  belongs_to :user
  belongs_to :house_style

  validates :name, presence: true, length: { maximum: 100 }
  validates :location, :owner, :basement, :contact, presence: true
  validates :year, :floors, :price, :sq_ft, presence: true, numericality: true
end
