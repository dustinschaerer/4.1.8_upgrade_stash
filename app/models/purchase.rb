class Purchase < ActiveRecord::Base
  
  belongs_to :user
  has_many :lines 
  has_many :transactions, :class_name => 'PurchaseTransaction', :dependent => :destroy
  
  accepts_nested_attributes_for :lines

  attr_accessor :card_number, :card_verification
  
  validate :validate_card, { on: :create }

  validates :user_id, :firstname, :lastname, :telephone, :contactby, :pay_type, presence: true
  validates :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, presence: true
  validates :pay_firstname, :pay_lastname, :pay_telephone, presence: true
  validates :pay_street_address, :pay_city, :pay_state, :pay_zipcode, :pay_country, presence: true
  validates :pay_type, :pay_status, :status, presence: true

  PAYMENT_TYPES = [ "Credit Card" ]

  def add_lines_from_quote(quote)

    #find each line in the quote
    

    quote.lines.each do |thisline|
     # Don't do this, it would remove the quote_id from line 
     # thisline.quote_id = nil
        lines << thisline 
    end
  end
  
  def purchase_the_order
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    purchase.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end
  
  def price_in_cents
    (total*100).round
  end
  
  def is_complete?
    if (self.status == "Shipped")
      true
    end 
  end

  private
  
  def purchase_options
    {
      :ip =>  '127.000.100.001',
      :billing_address => {
        :name     => "Dusty Farlow",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add :base, message
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      #:type               => card_type,
      :brand              => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => pay_firstname,
      :last_name          => pay_lastname
    )
  end

end
