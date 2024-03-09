class CreateEmployee < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false, limit: 80
      t.string :last_name, null: false, limit: 80
      t.string :email, null: false, limit: 80
      t.datetime :joining_date, null: false
      t.integer :monthly_salary, null: false

      t.timestamps
    end

    create_table :contact_numbers do |t|
      t.string :mobile_number
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
