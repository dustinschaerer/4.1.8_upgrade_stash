class RemoveLastQuoteSystemTables < ActiveRecord::Migration
  def up
    drop_table :items
    drop_table :vinyls
  end

  def down
	  create_table "items", force: true do |t|
	    t.integer  "quotecart_id"
	    t.integer  "itemable_id"
	    t.string   "itemable_type"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "purchase_id"
	    t.integer  "quote_id"
	    t.timestamps
	  end

	  add_index "items", ["purchase_id"], name: "index_items_on_purchase_id", using: :btree
	  add_index "items", ["quote_id"], name: "index_items_on_quote_id", using: :btree
	  add_index "items", ["quotecart_id"], name: "index_items_on_quotecart_id", using: :btree

	  create_table "vinyls", force: true do |t|
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
	    t.integer  "cover_id"
	    t.integer  "shape_id"
	    t.timestamps
	  end

	  add_index "vinyls", ["color_id"], name: "index_vinyls_on_color_id", using: :btree
	  add_index "vinyls", ["cover_id"], name: "index_vinyls_on_cover_id", using: :btree
	  add_index "vinyls", ["series_id"], name: "index_vinyls_on_series_id", using: :btree
	  add_index "vinyls", ["shape_id"], name: "index_vinyls_on_shape_id", using: :btree
	end
end