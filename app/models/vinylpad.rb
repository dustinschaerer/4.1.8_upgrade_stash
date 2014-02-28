class Vinylpad < ActiveRecord::Base
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}
end
