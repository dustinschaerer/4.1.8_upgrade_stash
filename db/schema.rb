# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140407223642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", force: true do |t|
    t.integer  "series_id"
    t.string   "name"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "notforupholstery", default: false
  end

  add_index "colors", ["series_id"], name: "index_colors_on_series_id", using: :btree

  create_table "covers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
    t.integer  "series_id"
    t.integer  "color_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["color_id"], name: "index_line_items_on_color_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["series_id"], name: "index_line_items_on_series_id", using: :btree

  create_table "lines", force: true do |t|
    t.integer  "quote_product_id"
    t.integer  "length"
    t.integer  "width"
    t.integer  "height"
    t.integer  "cover_id"
    t.integer  "series_id"
    t.integer  "color_id"
    t.integer  "shape_id"
    t.boolean  "umbrella"
    t.boolean  "velcro"
    t.integer  "yards"
    t.integer  "size_id"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quoteholder_id"
    t.integer  "quote_id"
    t.integer  "purchase_id"
  end

  add_index "lines", ["color_id"], name: "index_lines_on_color_id", using: :btree
  add_index "lines", ["cover_id"], name: "index_lines_on_cover_id", using: :btree
  add_index "lines", ["purchase_id"], name: "index_lines_on_purchase_id", using: :btree
  add_index "lines", ["quote_id"], name: "index_lines_on_quote_id", using: :btree
  add_index "lines", ["quote_product_id"], name: "index_lines_on_quote_product_id", using: :btree
  add_index "lines", ["quoteholder_id"], name: "index_lines_on_quoteholder_id", using: :btree
  add_index "lines", ["series_id"], name: "index_lines_on_series_id", using: :btree
  add_index "lines", ["shape_id"], name: "index_lines_on_shape_id", using: :btree
  add_index "lines", ["size_id"], name: "index_lines_on_size_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "order_id"
    t.integer  "quote_id"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
  end

  create_table "orders", force: true do |t|
    t.string   "firstname"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lastname"
    t.integer  "user_id"
    t.string   "status"
    t.string   "company"
    t.string   "zipcode"
    t.string   "contactby"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "thumbnail_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "purchase_transactions", force: true do |t|
    t.integer  "purchase_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "message"
    t.text     "params"
    t.boolean  "test"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authorization"
  end

  add_index "purchase_transactions", ["purchase_id"], name: "index_purchase_transactions_on_purchase_id", using: :btree

  create_table "purchases", force: true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "telephone"
    t.string   "contactby"
    t.string   "ship_street_address"
    t.string   "ship_city"
    t.string   "ship_state"
    t.string   "ship_zipcode"
    t.string   "ship_country"
    t.string   "pay_street_address"
    t.string   "pay_city"
    t.string   "pay_state"
    t.string   "pay_zipcode"
    t.string   "pay_country"
    t.decimal  "subtotal"
    t.decimal  "shipping"
    t.decimal  "sales_tax"
    t.decimal  "total"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
    t.string   "pay_firstname"
    t.string   "pay_lastname"
    t.string   "pay_company"
    t.string   "pay_telephone"
    t.string   "pay_status"
    t.string   "status"
    t.integer  "amount"
    t.string   "state",               default: "pending"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.string   "ip_address"
    t.string   "email"
  end

  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree

  create_table "quote_products", force: true do |t|
    t.string   "name"
    t.integer  "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotecarts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quoteholders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", force: true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "telephone"
    t.string   "contactby"
    t.string   "ship_street_address"
    t.string   "ship_city"
    t.string   "ship_state"
    t.string   "ship_zipcode"
    t.string   "ship_country"
    t.decimal  "subtotal"
    t.decimal  "shipping"
    t.decimal  "sales_tax"
    t.decimal  "total"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
    t.string   "status"
    t.string   "email"
  end

  add_index "quotes", ["user_id"], name: "index_quotes_on_user_id", using: :btree

  create_table "series", force: true do |t|
    t.integer  "style_id"
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "lead",        default: ""
    t.text     "callout",     default: ""
    t.string   "vertical",    default: "nil"
    t.string   "horizontal",  default: "nil"
    t.string   "side",        default: "nil"
    t.string   "swapimage"
    t.string   "smallimage"
  end

  add_index "series", ["style_id"], name: "index_series_on_style_id", using: :btree

  create_table "shapes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shipping_profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "company"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shipping_profiles", ["user_id"], name: "index_shipping_profiles_on_user_id", using: :btree

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "sizes", force: true do |t|
    t.string   "dimension"
    t.integer  "minimum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
    t.integer  "sort"
  end

  add_index "styles", ["product_id"], name: "index_styles_on_product_id", using: :btree

  create_table "subscribers", force: true do |t|
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
