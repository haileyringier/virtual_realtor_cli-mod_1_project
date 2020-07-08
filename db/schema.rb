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

ActiveRecord::Schema.define(version: 2020_07_08_034425) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
  end

  create_table "houses", force: :cascade do |t|
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.boolean "yard"
    t.string "location"
  end

  create_table "viewings", force: :cascade do |t|
    t.integer "client_id"
    t.integer "house_id"
    t.index ["client_id"], name: "index_viewings_on_client_id"
    t.index ["house_id"], name: "index_viewings_on_house_id"
  end

end
