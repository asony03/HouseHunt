class House < ApplicationRecord
  belongs_to :real_estate_company
  belongs_to :user
  belongs_to :house_style
  has_many :inquiries

  validates :name, :location, :owner, :basement, :contact, presence: true
  validates :year, :floors, :price, :sq_ft, presence: true, numericality: true
end
