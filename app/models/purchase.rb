class Purchase < ActiveRecord::Base
  
  belongs_to :user
  has_many :lines 
  has_one :quote
  has_many :transactions, :class_name => 'PurchaseTransaction', :dependent => :destroy
  
  accepts_nested_attributes_for :lines
  attr_accessor :card_number, :card_verification
  
  validates :card_expires_on, presence: true
  validates :user_id, :firstname, :lastname, :telephone, :contactby, :pay_type, presence: true
  validates :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, presence: true
  validates :pay_firstname, :pay_lastname, :pay_telephone, presence: true
  validates :pay_street_address, :pay_city, :pay_state, :pay_zipcode, :pay_country, presence: true
  validates :pay_type, :pay_status, :status, presence: true
  
  validate :validate_card, on: :create, if: :is_ready?
  
  def is_ready?
    if card_expires_on.blank? 
      false
    else
      true 
    end  
  end 

  PAYMENT_TYPES = [ "Credit Card" ]

  def add_lines_from_quote(quote)
    #find each line in the quote
    @quote = Quote.find(quote.id)
    @quote.lines.each do |thisline|
     # Don't do this, it would remove the quote_id from line 
     # thisline.quote_id = nil
        lines << thisline 
    end
    @quote.update_attribute(:status, "Purchased")
    @quote.save
  end
  
  def purchase_the_order
    response = GATEWAY.purchase(amount, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => amount, :response => response)
    purchase.update_attribute(:purchased_at, Time.now) if response.success?
    purchase.update_attribute(:status, "Purchased") if response.success?
    response.success?
  end

  def purchase_options
    {
      :ip =>  '127.000.000.001',
      
    }
  end
  
  def self.amount
    (self.total*100).round
  end
  
  def is_complete?
    if (self.status == "Shipped")
      true
    end 
  end
  
  def set_amount(total)
    self.amount = (total*100).round
  end

  def recalculate_totals
    calculate_subtotal
    calculate_sales_tax
    calculate_total
  end  
  
  def update_quote_status(quote)
    quote.status = "Purchased"
    quote.save!
  end

  private
  
    def validate_card
      unless credit_card.valid?
        credit_card.errors.each do |attr, messages|
          # Map to the model properties, assuming you used the 
          # setup from the Railscast
          if attr =~ /month|year/
            attr = 'card_expires_on'
          elsif attr =~ /number/
            attr = 'card_number'
          elsif attr =~ /verification_value/
            attr = 'card_verifictaion'
          elsif attr =~ /first_name/
            attr = 'pay_firstname'
          elsif attr =~ /last_name/
            attr = 'pay_lastname'
          else
            attr = "card_#{attr}".gsub(/_value/, '')
          end
          messages.each { |m| errors.add(attr, m) unless errors[attr].include?(m) }
        end
      end
    end
    
    def credit_card
      @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
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
