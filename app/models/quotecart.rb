class Quotecart < ActiveRecord::Base
 has_many :items, dependent: :destroy

 def add_quoteitem(itemable_id, itemable_type)
		
		current_quote_item = items.find_by(itemable_id: itemable_id, itemable_type: itemable_type)

		if current_quote_item
			current_quote_item.quantity += 1
		else
			current_quote_item = items.build(itemable_id: itemable_id, itemable_type: itemable_type)

		end	
		current_quote_item
	end

end
