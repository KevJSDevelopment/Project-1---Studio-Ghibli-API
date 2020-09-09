# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_09_152235) do

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "release_date"
    t.integer "rating"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "terrain"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "species"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.text "classification"
  end

end
