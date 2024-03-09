class ContactNumber < ApplicationRecord
  belongs_to :employee

  validates :mobile_number, presence: true
end
