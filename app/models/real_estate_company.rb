class RealEstateCompany < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :houses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  #validates :url, format: URI.regexp(%w[http https])
  validates :address, :synopsis, presence: true
  validates :founded, :revenue, :size, presence: true
  validates :founded, presence: true, numericality: true
end
