# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
employees = [
  {
    first_name: 'Abdul',
    last_name: 'syed',
    email: 'syedabdulazeez@gmail.com',
    joining_date: Date.new(2023, 2, 15),
    monthly_salary: 60_000,
    contact_numbers_attributes: [{ mobile_number: '8331892055' }]
  },
  {
    first_name: 'Ghattamaneni',
    last_name: 'Mahesh Babu',
    email: 'ghattamanenimahesh@gmail.com',
    joining_date: Date.new(2020, 6, 15),
    monthly_salary: 85_000,
    contact_numbers_attributes: [{ mobile_number: '9998887770' }]
  }
]

employees.each do |employee|
  Employee.create!(employee)
end
