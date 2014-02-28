class Nonslipcut < ActiveRecord::Base
  has_many :items, :as => :itemable

  before_destroy :ensure_not_referenced_by_any_item

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :inches_wide, :inches_long, presence: true, numericality: {greater_than_or_equal_to: 1}

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
