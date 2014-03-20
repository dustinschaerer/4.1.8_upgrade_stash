class Color < ActiveRecord::Base
	belongs_to :series
	has_many :line_items
  has_many :lines
    
    has_many :vinyls
    has_many :vinylrolls
    has_many :laminates
    has_many :laminaterolls

	before_destroy :ensure_not_referenced_by_any_line_item

	acts_as_taggable

  validates :name, :image_url, :series_id, presence: true
  
	
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
