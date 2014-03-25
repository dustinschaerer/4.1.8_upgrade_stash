class Quote < ActiveRecord::Base
  belongs_to :user
  has_many :lines, dependent: :destroy

  accepts_nested_attributes_for :lines

  validates :user_id, :firstname, :lastname, :telephone, :contactby, :pay_type, presence: true
  validates :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, presence: true
  validates :subtotal, :shipping, :sales_tax, :total, presence: true

  def add_items_from_quotecart(quotecart)
  	quotecart.items.each do |quoteitem|
  		quoteitem.quotecart_id = nil
        items << quoteitem 
  	end
  end
  
  def add_lines_from_quoteholder(quoteholder)
    quoteholder.lines.each do |quoteline|
      quoteline.quoteholder_id = nil
        lines << quoteline 
    end
  end

end
