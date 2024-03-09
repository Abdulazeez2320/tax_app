# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_09_062043) do
  create_table "contact_numbers", force: :cascade do |t|
    t.string "mobile_number"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_contact_numbers_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name", limit: 80, null: false
    t.string "last_name", limit: 80, null: false
    t.string "email", limit: 80, null: false
    t.datetime "joining_date", null: false
    t.integer "monthly_salary", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contact_numbers", "employees"
end
