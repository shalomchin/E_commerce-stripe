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

ActiveRecord::Schema.define(version: 20170316015936) do

  create_table "line_items", force: :cascade do |t|
    t.integer  "quantity"
    t.string   "reservation"
    t.integer  "product_id_id"
    t.integer  "cart_id_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cart_id_id"], name: "index_line_items_on_cart_id_id"
    t.index ["product_id_id"], name: "index_line_items_on_product_id_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "reservation"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
