class PotentialBuyer < ApplicationRecord
  belongs_to :house
  has_one :user
end
