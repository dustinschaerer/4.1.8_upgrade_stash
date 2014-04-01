class Purchase < ActiveRecord::Base
  
  belongs_to :user
  has_many :lines, dependent: :destroy

  validates :user_id, :firstname, :lastname, :telephone, :contactby, :pay_type, presence: true
  validates :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, presence: true
  validates :pay_firstname, :pay_lastname, :pay_telephone, presence: true
  validates :pay_street_address, :pay_city, :pay_state, :pay_zipcode, :pay_country, presence: true
  validates :pay_type, :pay_status, :status, presence: true

  PAYMENT_TYPES = [ "Credit Card" ]

  def copy_stuff
    @quote = Quote.find(params[:id])
    @purchase.firstname = @quote.firstname
    @purchase.lastname = @quote.lastname
    @purchase.telephone = @quote.telephone
    @purchase.user_id = @quote.user_id
    @purchase.contactby = @quote.contactby
    @purchase.ship_street_address = @quote.ship_street_address
    @purchase.ship_city = @quote.ship_city
    @purchase.ship_state = @quote.ship_state
    @purchase.ship_state = @quote.ship_zipcode
    @purchase.ship_country = @quote.ship_country
    @purchase.subtotal= @quote.subtotal
    @purchase.shipping = @quote.shipping
    @purchase.sales_tax = @quote.sales_tax
    @purchase.total = @quote.total
  end


end
