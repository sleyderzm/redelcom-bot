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

ActiveRecord::Schema[7.0].define(version: 2023_07_22_003953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_options", force: :cascade do |t|
    t.string "text"
    t.integer "alias"
    t.bigint "next_option_id"
    t.string "action"
    t.string "validation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_option_id"], name: "index_chat_options_on_next_option_id"
  end

  create_table "conversation_answers", force: :cascade do |t|
    t.bigint "chat_option_id", null: false
    t.bigint "conversation_id", null: false
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_option_id"], name: "index_conversation_answers_on_chat_option_id"
    t.index ["conversation_id"], name: "index_conversation_answers_on_conversation_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "current_option_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_option_id"], name: "index_conversations_on_current_option_id"
    t.index ["customer_id"], name: "index_conversations_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "rut"
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "address"
    t.date "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chat_options", "chat_options", column: "next_option_id"
  add_foreign_key "conversation_answers", "chat_options"
  add_foreign_key "conversation_answers", "conversations"
  add_foreign_key "conversations", "chat_options", column: "current_option_id"
  add_foreign_key "conversations", "customers"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "customers"
end
