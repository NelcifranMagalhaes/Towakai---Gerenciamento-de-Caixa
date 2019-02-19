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

ActiveRecord::Schema.define(version: 2019_02_19_144441) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_types", force: :cascade do |t|
    t.string "name"
    t.float "tax_discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.string "email"
    t.string "cnpj"
    t.string "phone"
    t.bigint "client_type_id"
    t.float "weight"
    t.float "height"
    t.index ["client_type_id"], name: "index_clients_on_client_type_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "product_id"
    t.integer "quant"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["sale_id"], name: "index_orders_on_sale_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.string "size"
  end

  create_table "products", force: :cascade do |t|
    t.integer "cost_price_cents", default: 0, null: false
    t.string "cost_price_currency", default: "BRL", null: false
    t.integer "sale_price_cents", default: 0, null: false
    t.string "sale_price_currency", default: "BRL", null: false
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "low_quantity"
    t.bigint "product_type_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "client_id"
    t.date "sale_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "status_sale_id"
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["status_sale_id"], name: "index_sales_on_status_sale_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "status_sales", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "clients", "client_types"
  add_foreign_key "products", "product_types"
  add_foreign_key "sales", "status_sales"
  add_foreign_key "sales", "users"
end
