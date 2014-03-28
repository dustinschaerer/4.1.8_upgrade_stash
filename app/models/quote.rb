class Quote < ActiveRecord::Base

  before_save :total_price
  before_save :recalculate_totals
  
  belongs_to :user
  has_many :lines, dependent: :destroy

  accepts_nested_attributes_for :lines

  validates :user_id, :firstname, :lastname, :telephone, :contactby, :pay_type, presence: true
  validates :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, presence: true
  validates :subtotal, :shipping, :sales_tax, :total, presence: true, numericality: true
  

  
  def add_lines_from_quoteholder(quoteholder)
    quoteholder.lines.each do |quoteline|
      quoteline.quoteholder_id = nil
        lines << quoteline 
    end
  end


  def total_price
    lines.to_a.sum { |line| line.total_price }
  end 


  def calculate_subtotal
    self.subtotal = total_price
  end

  def calculate_sales_tax
    if (self.ship_state == 'Arkansas')
      tax_rate = 0.0975 
    elsif (self.ship_state == 'Minnesota')
      tax_rate = 0.06875 
    elsif (self.ship_state == 'New Jersey')
      tax_rate = 0.07 
    else
      tax_rate = 0  
    end
    self.sales_tax = (self.subtotal * tax_rate).truncate(2)
  end

  def calculate_total
    self.total = (self.subtotal + self.shipping + self.sales_tax)
  end

  def recalculate_totals
    calculate_subtotal
    calculate_sales_tax
    calculate_total
  end  

end
