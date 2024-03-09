class Employee < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :contact_numbers, dependent: :destroy
  accepts_nested_attributes_for :contact_numbers

  validates :first_name, :last_name, :joining_date, :monthly_salary, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, presence: true,
                    length: { maximum: 80 }
  validate :is_mobile_number_present

  private

  def is_mobile_number_present
    if contact_numbers.empty? || contact_numbers.all? { |mobile_number| mobile_number.marked_for_destruction? }
      errors.add(:contact_numbers, 'Should not be empty')
    end
  end
end
