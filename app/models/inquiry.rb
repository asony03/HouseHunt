class Inquiry < ApplicationRecord
  belongs_to :user
  has_one :house

  validates :subject, :msg, presence: true
end
