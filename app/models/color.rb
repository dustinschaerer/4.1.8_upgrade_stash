class Color < ActiveRecord::Base
	belongs_to :series
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	acts_as_taggable_on :tags
	
	private

	  def ensure_not_referenced_by_any_line_item
        if line_items.empty?
          return true
        else
          errors.add(:base, 'Line Items present')	
          return false
        end
	 end
	 
end
