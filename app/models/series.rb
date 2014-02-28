class Series < ActiveRecord::Base

	belongs_to :style
	has_many :colors
	has_many :line_items
	has_many :orders, through: :line_items
	has_many :vinyls
    has_many :vinylrolls
    has_many :laminates
    has_many :laminaterolls

	before_destroy :ensure_not_referenced_by_any_line_item
    
    

	validates :name, :description, :image_url, presence: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
    
	def self.latest
    	Series.order(:updated_at).last
  	end

  	def self.distinction(id)
    	where("id = ?", id)
    end

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
