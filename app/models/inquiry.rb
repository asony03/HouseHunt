class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :subject, :msg, presence: true
end
