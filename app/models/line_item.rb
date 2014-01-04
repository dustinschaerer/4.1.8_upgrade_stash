class LineItem < ActiveRecord::Base
  belongs_to :order	
  belongs_to :cart
  belongs_to :series
  belongs_to :color

  delegate :name, :category_id, :description, :image_url, to: :series, prefix: true

end
