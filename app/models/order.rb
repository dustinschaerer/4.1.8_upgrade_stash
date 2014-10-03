class Order < ActiveRecord::Base

	has_many :line_items, dependent: :destroy
	belongs_to :user
    
  accepts_nested_attributes_for :line_items

	validates :firstname, :lastname, :street_address, :city, :zipcode, :state, :country, :email, :user_id, :status, presence: true
  validates :state, inclusion: ::STATES, if: :is_usa?
  validates :state, inclusion: ::PROVINCES, if: :is_canada?

  def is_usa?
    (country == 'United States') 
  end

  def is_canada?
    (country == 'Canada') 
  end

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
  end

  def is_complete?
    if (self.status == "Shipped")
     	true
    end	
  end

  def current_color
    if (self.status == "Submitted")
      return :warn
    elsif (self.status == "Shipped")
      return :ok
    elsif (self.status == "Offline Purchased")
      return :offline_purchased
    elsif (self.status == "Purchased")
      return :error
    end
  end

end
