# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191010184737) do

  create_table "employees", force: :cascade do |t|
    t.string "Employee_Status"
    t.string "Lastname"
    t.string "Firstname"
    t.string "image"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hardwares", force: :cascade do |t|
    t.string "owner"
    t.string "host"
    t.string "os"
    t.string "os_version"
    t.date "install_date"
    t.date "boot_time"
    t.string "make"
    t.string "model"
    t.string "type"
    t.string "processor"
    t.integer "physical_memory"
    t.integer "available_physical_memory"
    t.string "serial_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "issue_date"
    t.date "return_date"
    t.integer "employee_id"
  end

end
