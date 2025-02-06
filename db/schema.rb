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

ActiveRecord::Schema[7.2].define(version: 2025_01_29_172436) do
  create_table "menu_items", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "item_name"
    t.text "description"
    t.decimal "price"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "order_carts", force: :cascade do |t|
    t.integer "order_id"
    t.integer "menu_item_id"
    t.integer "quantity"
    t.decimal "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_order_carts_on_menu_item_id"
    t.index ["order_id"], name: "index_order_carts_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "restaurant_table_id"
    t.integer "user_id"
    t.decimal "order_amount"
    t.string "order_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_table_id"], name: "index_orders_on_restaurant_table_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "restaurant_tables", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "qr_code_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_tables_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "restaurant_name"
    t.string "address"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "menu_item_id"
    t.float "rating"
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_reviews_on_menu_item_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_restaurants", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_user_restaurants_on_restaurant_id"
    t.index ["user_id"], name: "index_user_restaurants_on_user_id"
  end

  create_table "user_roles", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "order_carts", "menu_items"
  add_foreign_key "order_carts", "orders"
  add_foreign_key "orders", "restaurant_tables"
  add_foreign_key "orders", "users"
  add_foreign_key "restaurant_tables", "restaurants"
  add_foreign_key "reviews", "menu_items"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_restaurants", "restaurants"
  add_foreign_key "user_restaurants", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
