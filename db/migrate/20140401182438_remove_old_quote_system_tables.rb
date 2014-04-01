class RemoveOldQuoteSystemTables < ActiveRecord::Migration
  def up
    drop_table :americlears
    drop_table :frogs
    drop_table :laminatecuts
    drop_table :laminaterolls
    drop_table :laminates
    drop_table :nonslipcuts
    drop_table :nonslippads
    drop_table :upholsterycuts
    drop_table :upholsteryrolls
    drop_table :vinylcuts
    drop_table :vinylpads
    drop_table :vinylrolls
  end


  def down
    create_table :tablename do |t|
      t.string :table_column
      t.references :anothertable

      t.timestamps        
    end
    add_index :tablenames, :anothertable_id



    create_table "americlears", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "yards"
	    t.integer  "wide"
	    t.integer  "price"
	    t.timestamps
		end

    create_table "frogs", force: true do |t|
	    t.string   "name"
	    t.string   "size"
	    t.timestamps
    end 

   	create_table "laminatecuts", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "yards_long"
	    t.integer  "series_id"
	    t.integer  "color_id"
	    t.integer  "price"
	    t.timestamps
	  end
    add_index "laminatecuts", ["color_id"], name: "index_laminatecuts_on_color_id", using: :btree
    add_index "laminatecuts", ["series_id"], name: "index_laminatecuts_on_series_id", using: :btree

    create_table "laminaterolls", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "series_id"
	    t.integer  "color_id"
	    t.integer  "price"
	    t.timestamps
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
	    t.timestamps
	    t.integer  "diameter"
	  end
	  add_index "laminates", ["color_id"], name: "index_laminates_on_color_id", using: :btree
	  add_index "laminates", ["series_id"], name: "index_laminates_on_series_id", using: :btree
    
    create_table "nonslipcuts", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "inches_wide"
	    t.integer  "inches_long"
	    t.integer  "price"
	    t.timestamps
	  end

	  create_table "nonslippads", force: true do |t|
	    t.integer  "quantity"
	    t.string   "width"
	    t.integer  "price"
	    t.timestamps
	  end

	  create_table "upholsterycuts", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "series_id"
	    t.integer  "color_id"
	    t.integer  "price"
	    t.integer  "yards_long"
	    t.timestamps
	  end

	  add_index "upholsterycuts", ["color_id"], name: "index_upholsterycuts_on_color_id", using: :btree
	  add_index "upholsterycuts", ["series_id"], name: "index_upholsterycuts_on_series_id", using: :btree

	  create_table "upholsteryrolls", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "series_id"
	    t.integer  "color_id"
	    t.integer  "price"
	    t.timestamps
	  end

	  add_index "upholsteryrolls", ["color_id"], name: "index_upholsteryrolls_on_color_id", using: :btree
	  add_index "upholsteryrolls", ["series_id"], name: "index_upholsteryrolls_on_series_id", using: :btree

    create_table "vinylcuts", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "yards_long"
	    t.integer  "series_id"
	    t.integer  "color_id"
	    t.integer  "price"
	    t.timestamps
	  end

	  add_index "vinylcuts", ["color_id"], name: "index_vinylcuts_on_color_id", using: :btree
	  add_index "vinylcuts", ["series_id"], name: "index_vinylcuts_on_series_id", using: :btree

	  create_table "vinylpads", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "price"
	    t.timestamps
	  end

	  create_table "vinylrolls", force: true do |t|
	    t.integer  "quantity"
	    t.integer  "series_id"
	    t.integer  "color_id"
	    t.integer  "price"
	    t.timestamps
	  end

	  add_index "vinylrolls", ["color_id"], name: "index_vinylrolls_on_color_id", using: :btree
	  add_index "vinylrolls", ["series_id"], name: "index_vinylrolls_on_series_id", using: :btree




  end
end
