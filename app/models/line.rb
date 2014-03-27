class Line < ActiveRecord::Base
  belongs_to :quote
  belongs_to :quoteholder
  belongs_to :quote_product
  belongs_to :cover
  belongs_to :series
  belongs_to :color
  belongs_to :shape
  belongs_to :size


 # validates :color_id, presence: true
 # validates :cover_id, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :price, presence: true

  validates :shape_id, presence: true, if: :is_vinyl_tablecloth?
  validates :shape_id, presence: true, if: :is_laminate_tablecloth?

  def is_vinyl_tablecloth?
    quote_product_id == 1
  end  

  def is_laminate_tablecloth?
    quote_product_id == 2
  end    

  validates :width, presence: true, if: :is_round?
  def is_round?
    shape == "Round"
  end

  validates :width, :length, presence: true, if: :is_rectangle?
  def is_rectangle?
    shape == "Rectangle"
  end
  
  validates :width, presence: true, if: :is_square?
  def is_square?
    shape == "Square"
  end
  
  validates :height, presence: true, if: :in_height?
  def in_height?
    cover == "Fitted-to-Floor (Hat Box)" 
  end

  validates :height, presence: true, if: :is_height?
  def is_height?
    cover == "Regular Drape-to-Floor" 
  end  
  
  validates :series_id, presence: true, if: :is_series? 
  def is_series?
    quote_product_id == 1 
  end
  
  validates :series_id, presence: true, if: :in_series? 
  def in_series?
    quote_product_id == 2 
  end

  def total_price
		price * quantity
	end	

end
