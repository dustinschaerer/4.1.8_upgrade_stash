class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_swatch(series_id, color_id)
		#current_item = line_items.find_by(series_id: series_id)
		current_item = line_items.find_by(color_id: color_id)

		if current_item
			# current_item.quantity = 1
			# flash.now[:error] = 'This swatch is already in your cart.'
		else
			current_item = line_items.build(series_id: series_id, color_id: color_id)
		end
		current_item
	end

end