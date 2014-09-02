class Purchase < ActiveRecord::Base
  PAYMENT_TYPES = [ "Credit Card" ]

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
  validates :card_number, :card_verification, presence: true, on: :create
  validates :state, inclusion: ::STATES_AND_PROVINCES
  
  validate :validate_card, on: :create, if: :is_ready?
  
  #validates :state, inclusion: ::PROVINCES, if: :is_usa?
  #validates :state, inclusion: ::PROVINCES, if: :is_canada?

  def is_usa?
    (pay_country == 'United States') 
  end

  def is_canada?
    (pay_country == 'Canada') 
  end
  
  def is_ready?
    if card_expires_on.blank? 
      false
    else
      true 
    end  
  end 

  def add_lines_from_quote(quote)
    #find each line in the quote
    @quote = Quote.find(quote.id)
    @quote.lines.each do |thisline|
     # Don't do this, it would remove the quote_id from line 
     # thisline.quote_id = nil
        lines << thisline 
    end
  end
  
  def purchase_the_order
    gateway = ActiveMerchant::Billing::ElavonGateway.new(
      :login     => ENV['MVM_LOGIN_ID'],
      :password  => ENV['MVM_PIN'],
      :user      => ENV['MVM_USER_ID']
    )
    response = gateway.purchase(amount, credit_card)
    transactions.create!(:action => "purchase", :amount => amount, :response => response)
    self.update_attribute(:status, "Purchased") if response.success?
    response.success?
  end

  def purchase_options
    { }
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
               # :type               => card_type, 
                :brand              => card_type, 
                :first_name         => pay_firstname,
                :last_name          => pay_lastname,
                :number             => card_number,
                :month              => card_expires_on.month,
                :year               => card_expires_on.year,
                :verification_value => card_verification
      )
    end
         
  private
    

end