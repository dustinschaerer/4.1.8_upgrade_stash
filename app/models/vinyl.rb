class Vinyl < ActiveRecord::Base
  belongs_to :series
  belongs_to :color
  belongs_to :cover
  belongs_to :shape
  
  has_many :items, :as => :itemable

  before_destroy :ensure_not_referenced_by_any_item

  validates :series_id, presence: true 
  validates :color_id, presence: true
  validates :cover_id, presence: true
  validates :shape_id, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
  
  validates :diameter, presence: true, if: :is_round?
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
  
  validates :drop, presence: true, if: :in_drop?
  def in_drop?
    cover == "Regular Drape" 
  end

  validates :drop, presence: true, if: :is_drop?
  def is_drop?
    cover == "Fitted (Hat Box)" 
  end
  
  validates :height, presence: true, if: :in_height?
  def in_height?
    cover == "Fitted-to-Floor (Hat Box)" 
  end

  validates :height, presence: true, if: :is_height?
  def is_height?
    cover == "Regular Drape-to-Floor" 
  end  
  

  private

	  def ensure_not_referenced_by_any_item
      if items.empty?
        return true
      else
        errors.add(:base, 'Items present')	
        return false
      end
	 end

end