class Vinyl < ActiveRecord::Base
  belongs_to :series
  belongs_to :color
  has_many :items, :as => :itemable

  before_destroy :ensure_not_referenced_by_any_item

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
