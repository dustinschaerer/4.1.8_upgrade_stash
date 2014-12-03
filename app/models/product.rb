class Product < ActiveRecord::Base
  belongs_to :category
  has_many :styles
  has_many :series, through: :styles
	validates :title, :description, :image_url, :thumbnail_url, presence: true
	validates :title,  uniqueness: true
	validates :image_url, allow_blank: true, format: {
    with: %r{\A\.(gif|jpg|png)\z}i,
	  message: 'must be a URL for GIF, JPG or PNG image.'
  }

	private

end