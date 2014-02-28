class Americlear < ActiveRecord::Base
  has_many :items, :as => :itemable
  
  before_destroy :ensure_not_referenced_by_any_item

  validates :wide, presence: true
  validates :wide, numericality: { greater_than_or_equal_to: 45 }
  validates :wide, numericality: { less_than_or_equal_to: 58 }
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}  
  validates :yards, presence: true, numericality: {greater_than_or_equal_to: 1}

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
