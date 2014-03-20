class Line < ActiveRecord::Base
  belongs_to :quote
  belongs_to :quoteholder
  belongs_to :quote_product
  belongs_to :cover
  belongs_to :series
  belongs_to :color
  belongs_to :shape
  belongs_to :size


  def total_price
		self.price * quantity
	end	

end
