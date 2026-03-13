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

ActiveRecord::Schema[8.1].define(version: 2026_03_13_120953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "industry"
    t.string "location"
    t.integer "size"
    t.string "subscription_tier"
    t.datetime "updated_at", null: false
  end

  create_table "integrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "onboarding_states", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "onboarding_id", null: false
    t.integer "proggress", default: 0
    t.string "status", null: false
    t.string "step", null: false
    t.datetime "updated_at", null: false
    t.index ["onboarding_id"], name: "index_onboarding_states_on_onboarding_id"
  end

  create_table "onboardings", force: :cascade do |t|
    t.string "bundles"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.integer "default_days_of_stock"
    t.integer "default_forecasting_days"
    t.integer "default_lead_time"
    t.string "existing_pos"
    t.string "last_step", default: "start", null: false
    t.string "requested_integrations", default: [], array: true
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.boolean "vendors_as_suppliers"
    t.index ["user_id"], name: "index_onboardings_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "categories", default: [], array: true
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.integer "lead_time"
    t.string "name", null: false
    t.decimal "price"
    t.string "sku"
    t.bigint "supplier_id"
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "sales_histories", force: :cascade do |t|
    t.datetime "checkout_at"
    t.datetime "created_at", null: false
    t.datetime "delivery_at"
    t.string "delivery_id"
    t.integer "discount"
    t.datetime "payment_at"
    t.string "payment_id"
    t.bigint "product_id", null: false
    t.decimal "quantity"
    t.decimal "revenue"
    t.decimal "sales_price"
    t.datetime "updated_at", null: false
    t.bigint "warehouse_id"
    t.index ["product_id"], name: "index_sales_histories_on_product_id"
    t.index ["warehouse_id"], name: "index_sales_histories_on_warehouse_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "vendor_id"
    t.index ["vendor_id"], name: "index_suppliers_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users_integrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "integration_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["integration_id"], name: "index_users_integrations_on_integration_id"
    t.index ["user_id"], name: "index_users_integrations_on_user_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.integer "avg_lead_time"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "reliability_score"
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "address"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "type"
    t.datetime "updated_at", null: false
    t.bigint "users_id", null: false
    t.index ["name"], name: "index_warehouses_on_name", unique: true
    t.index ["users_id"], name: "index_warehouses_on_users_id"
  end

  create_table "warehouses_products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "product_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "warehouse_id", null: false
    t.index ["product_id"], name: "index_warehouses_products_on_product_id"
    t.index ["warehouse_id"], name: "index_warehouses_products_on_warehouse_id"
  end

  add_foreign_key "onboarding_states", "onboardings"
  add_foreign_key "onboardings", "users"
  add_foreign_key "products", "suppliers"
  add_foreign_key "sales_histories", "products"
  add_foreign_key "sales_histories", "warehouses"
  add_foreign_key "suppliers", "vendors"
  add_foreign_key "users_integrations", "integrations"
  add_foreign_key "users_integrations", "users"
  add_foreign_key "warehouses", "users", column: "users_id"
  add_foreign_key "warehouses_products", "products"
  add_foreign_key "warehouses_products", "warehouses"
end
