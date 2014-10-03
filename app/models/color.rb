class Color < ActiveRecord::Base
	belongs_to :series
	has_many :line_items
  has_many :lines

	before_destroy :ensure_not_referenced_by_any_line_item


#  validates :name, :image_url, :series_id, presence: true
#  validates :image_url, allow_blank: true, format: {
#		with: %r{\A\.+[\.](gif|jpg|jpeg|png)\z}i,
#		message: 'must be a URL for GIF, JPG or PNG image.'
#	}
  
	
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
