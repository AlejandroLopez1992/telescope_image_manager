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

ActiveRecord::Schema.define(version: 2023_03_22_205543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.bigint "telescope_id"
    t.string "name"
    t.text "image_description"
    t.boolean "earth_in_view"
    t.integer "exif_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["telescope_id"], name: "index_images_on_telescope_id"
  end

  create_table "telescopes", force: :cascade do |t|
    t.string "name"
    t.boolean "functioning"
    t.float "orbital_period"
    t.datetime "launch_date"
    t.text "mission"
    t.string "main_telescope_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "images", "telescopes"
end
