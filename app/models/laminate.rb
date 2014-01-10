class Laminate < ActiveRecord::Base
  belongs_to :series
  belongs_to :color
end
