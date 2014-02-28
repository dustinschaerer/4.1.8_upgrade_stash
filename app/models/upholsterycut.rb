class Upholsterycut < ActiveRecord::Base
  belongs_to :series
  belongs_to :color

  has_many :items, :as => :itemable

  before_destroy :ensure_not_referenced_by_any_item

  validates :series_id, presence: true 
  validates :color_id, presence: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :yards_long, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :yards_long, numericality: { greater_than_or_equal_to: 5 }
  validates :yards_long, numericality: { less_than_or_equal_to: 24 }
 
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
