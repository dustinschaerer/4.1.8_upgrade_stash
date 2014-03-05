class Quote < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :user_id, :firstname, :lastname, :telephone, :contactby, :pay_type, presence: true
  validates :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, presence: true
  # validates :subtotal, :shipping, :sales_tax, :total

  def add_items_from_quotecart(quotecart)
  	quotecart.items.each do |quoteitem|
  		quoteitem.quotecart_id = nil
        items << quoteitem 
  	end
  end

end
