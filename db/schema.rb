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

ActiveRecord::Schema.define(version: 2020_10_15_183615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assembly_lines", force: :cascade do |t|
    t.string "name"
    t.integer "assembly_order"
    t.bigint "factory_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["factory_id"], name: "index_assembly_lines_on_factory_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "status_cd"
    t.bigint "assembly_line_id"
    t.bigint "model_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assembly_line_id"], name: "index_cars_on_assembly_line_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
    t.index ["status_cd"], name: "index_cars_on_status_cd"
  end

  create_table "components", force: :cascade do |t|
    t.integer "type_cd"
    t.boolean "error"
    t.bigint "car_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_components_on_car_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "cost_price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "car_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_orders_on_car_id"
  end

end
