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

ActiveRecord::Schema.define(version: 20140227195713) do

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

  create_table "americlears", force: true do |t|
    t.integer  "quantity"
    t.integer  "yards"
    t.integer  "wide"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "frogs", force: true do |t|
    t.string   "name"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "quotecart_id"
    t.integer  "itemable_id"
    t.string   "itemable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["quotecart_id"], name: "index_items_on_quotecart_id", using: :btree

  create_table "laminatecuts", force: true do |t|
    t.integer  "quantity"
    t.integer  "yards_long"
    t.integer  "series_id"
    t.integer  "color_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "laminatecuts", ["color_id"], name: "index_laminatecuts_on_color_id", using: :btree
  add_index "laminatecuts", ["series_id"], name: "index_laminatecuts_on_series_id", using: :btree

  create_table "laminaterolls", force: true do |t|
    t.integer  "quantity"
    t.integer  "series_id"
    t.integer  "color_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "laminaterolls", ["color_id"], name: "index_laminaterolls_on_color_id", using: :btree
  add_index "laminaterolls", ["series_id"], name: "index_laminaterolls_on_series_id", using: :btree

  create_table "laminates", force: true do |t|
    t.string   "cover"
    t.string   "shape"
    t.integer  "width"
    t.integer  "length"
    t.integer  "height"
    t.string   "drop"
    t.integer  "series_id"
    t.integer  "color_id"
    t.boolean  "umbrella"
    t.boolean  "velcro"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "diameter"
  end

  add_index "laminates", ["color_id"], name: "index_laminates_on_color_id", using: :btree
  add_index "laminates", ["series_id"], name: "index_laminates_on_series_id", using: :btree

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

  create_table "nonslipcuts", force: true do |t|
    t.integer  "quantity"
    t.integer  "inches_wide"
    t.integer  "inches_long"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nonslippads", force: true do |t|
    t.integer  "quantity"
    t.string   "width"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "lastname",       default: "null"
    t.integer  "user_id",        default: 1
    t.string   "status",         default: "submitted"
    t.string   "company",        default: "null"
    t.string   "zipcode",        default: "null"
    t.string   "contactby",      default: "email"
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

  create_table "quotecarts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "series", ["style_id"], name: "index_series_on_style_id", using: :btree

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
    t.integer  "user_id"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["user_id"], name: "index_subscribers_on_user_id", using: :btree

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

  create_table "upholsterycuts", force: true do |t|
    t.integer  "quantity"
    t.integer  "series_id"
    t.integer  "color_id"
    t.integer  "price"
    t.integer  "yards_long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upholsterycuts", ["color_id"], name: "index_upholsterycuts_on_color_id", using: :btree
  add_index "upholsterycuts", ["series_id"], name: "index_upholsterycuts_on_series_id", using: :btree

  create_table "upholsteryrolls", force: true do |t|
    t.integer  "quantity"
    t.integer  "series_id"
    t.integer  "color_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upholsteryrolls", ["color_id"], name: "index_upholsteryrolls_on_color_id", using: :btree
  add_index "upholsteryrolls", ["series_id"], name: "index_upholsteryrolls_on_series_id", using: :btree

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

  create_table "vinylcuts", force: true do |t|
    t.integer  "quantity"
    t.integer  "yards_long"
    t.integer  "series_id"
    t.integer  "color_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vinylcuts", ["color_id"], name: "index_vinylcuts_on_color_id", using: :btree
  add_index "vinylcuts", ["series_id"], name: "index_vinylcuts_on_series_id", using: :btree

  create_table "vinylpads", force: true do |t|
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vinylrolls", force: true do |t|
    t.integer  "quantity"
    t.integer  "series_id"
    t.integer  "color_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vinylrolls", ["color_id"], name: "index_vinylrolls_on_color_id", using: :btree
  add_index "vinylrolls", ["series_id"], name: "index_vinylrolls_on_series_id", using: :btree

  create_table "vinyls", force: true do |t|
    t.string   "cover"
    t.string   "shape"
    t.integer  "width"
    t.integer  "length"
    t.integer  "height"
    t.string   "drop"
    t.integer  "series_id"
    t.integer  "color_id"
    t.boolean  "umbrella"
    t.boolean  "velcro"
    t.integer  "quantity"
    t.integer  "price",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "diameter"
  end

  add_index "vinyls", ["color_id"], name: "index_vinyls_on_color_id", using: :btree
  add_index "vinyls", ["series_id"], name: "index_vinyls_on_series_id", using: :btree

end
