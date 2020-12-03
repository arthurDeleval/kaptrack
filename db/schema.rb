# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file iss the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_02_101224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "checklist_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checklist_id"], name: "index_assignments_on_checklist_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.date "message_date"
    t.bigint "message_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_chatrooms_on_message_id"
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "deadline"
    t.integer "priority_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_consumptions", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "recipe_id", null: false
    t.bigint "performance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["performance_id"], name: "index_customer_consumptions_on_performance_id"
    t.index ["recipe_id"], name: "index_customer_consumptions_on_recipe_id"
  end

  create_table "lots", force: :cascade do |t|
    t.date "expiration_date"
    t.integer "cost"
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_lots_on_product_id"
    t.index ["supplier_id"], name: "index_lots_on_supplier_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer "customer_number"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plannings", force: :cascade do |t|
    t.time "starting_shift"
    t.time "ending_shift"
    t.date "starting_date"
    t.date "ending_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_plannings_on_user_id"
  end

  create_table "product_recipes", force: :cascade do |t|
    t.integer "recipe_quantity"
    t.bigint "recipe_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_recipes_on_product_id"
    t.index ["recipe_id"], name: "index_product_recipes_on_recipe_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "measure_unit"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "recipe_description"
    t.integer "price"
    t.integer "preparation_time"
    t.string "specificity"
    t.string "meal_description"
    t.boolean "menu_visible", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "phone_number"
    t.integer "delivery_estimation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.boolean "validation", default: false
    t.bigint "checklist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checklist_id"], name: "index_tasks_on_checklist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.integer "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "checklists"
  add_foreign_key "assignments", "users"
  add_foreign_key "chatrooms", "messages"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "customer_consumptions", "performances"
  add_foreign_key "customer_consumptions", "recipes"
  add_foreign_key "lots", "products"
  add_foreign_key "lots", "suppliers"
  add_foreign_key "plannings", "users"
  add_foreign_key "product_recipes", "products"
  add_foreign_key "product_recipes", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "tasks", "checklists"
end
