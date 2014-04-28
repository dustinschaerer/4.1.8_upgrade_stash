class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  has_many :products
end
