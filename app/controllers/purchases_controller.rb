class PurchasesController < ApplicationController

  before_action :authenticate_admin_user!, :except => [:new, :create, :show, :update] 
  include CurrentQuote
  include CurrentCart
  before_action :set_cart
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, unless: :current_admin_user

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end
    
  # GET /purchases/new
  def new
    @purchase = Purchase.new
    #if we just came here from the user show
    if (params[:quote_id]) 
      @quote = Quote.find(params[:quote_id])
    # else we came from validation failing on this page
    else
      @quote = Quote.find(params[:purchase][:quote_id])
    end
    @purchase.firstname = @quote.firstname
    @purchase.lastname = @quote.lastname
    @purchase.company = @quote.company
    @purchase.tax_id = @quote.tax_id
    @purchase.telephone = @quote.telephone
    @purchase.user_id = @quote.user_id
    @purchase.contactby = @quote.contactby
    @purchase.ship_street_address = @quote.ship_street_address
    @purchase.ship_city = @quote.ship_city
    @purchase.ship_state = @quote.ship_state
    @purchase.ship_zipcode = @quote.ship_zipcode
    @purchase.ship_country = @quote.ship_country
    @purchase.subtotal= @quote.subtotal
    @purchase.shipping = @quote.shipping
    @purchase.sales_tax = @quote.sales_tax
    @purchase.total = @quote.total
    @purchase.ip_address = request.ip
    @purchase.amount = @quote.amount
    @purchase.quote_id = @quote.id
  end

   # GET /purcashes/1/edit
  def edit
    
  end

  # POST /purchases
  # POST /purchases.json
  def create

    if (params[:checkbox_use_same_address] == true)
      @purchase.pay_firstname = @purchase.firstname 
      @purchase.pay_lastname = @purchase.lastname 
      @purchase.pay_company = @purchase.company 
      @purchase.pay_telephone = @purchase.telephone
      @purchase.pay_street_address = @purchase.ship_street_address 
      @purchase.pay_city = @purchase.ship_city 
      @purchase.pay_zipcode = @purchase.ship_zipcode
      @purchase.pay_state = @purchase.ship_state
      @purchase.pay_country = @purchase.ship_country
    end

    @quote = Quote.find(purchase_params[:quote_id])
    @purchase = Purchase.new(purchase_params)
    # Add purchase ref to lines
    @purchase.add_lines_from_quote(@quote)   
    
    if @purchase.save
      # attempt purchase
      if @purchase.purchase_the_order
        # update statuses to Purchased
        @purchase.status = 'Purchased'
        @purchase.save
        @quote.status = 'Purchased'
        @quote.save
        # send purchase notification email 
        PurchaseNotifier.confirmation(@purchase, current_user).deliver
        PurchaseNotifier.notify_admin(@purchase).deliver
        
        respond_to do |format|
          format.html { redirect_to @purchase, notice: 'PURCHASE COMPLETED! We will send a confirmation email about your purchase and another email once your order has shipped. Check your account Dashboard to see your Purchase, Quote, and free Swatch Order Histories.'  }
          format.json { render action: 'show', status: :created, location: @purchase }
        end          
      else  
        @purchase.destroy
        respond_to do |format|
          #maybe render template here instead with a return link to purchase
          format.html { redirect_to new_purchase_path(quote_id: @quote.id), notice: 'FAILURE: Credit Card Invalid. Please enter your valid card card information to place your order now.' }
          #new_purchase_path(quote_id: quote)
        end
      end
    else
      respond_to do |format|  
        format.html { render action: 'new', notice: 'Purchase could not be completed. See errors for details.' }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end  
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
            format.html { redirect_to @purchase, notice: "PURCHASE COMPLETED! We'll send a confirmation email about your purchase and another email once your order has shipped. Check your account Dashboard to see your Purchase, Quote, and free Swatch Order Histories." }
            format.json { render action: 'show', status: :created, location: @purchase }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:user_id, :firstname, :lastname, :telephone, 
        :contactby, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, 
        :ship_country, :pay_firstname, :pay_lastname, :pay_company, :pay_telephone, 
        :pay_status, :status, :pay_street_address, :pay_city, :pay_state, :pay_zipcode, 
        :pay_country, :subtotal, :shipping, :sales_tax, :total, :pay_type, :card_type, 
        :card_expires_on, :state, :ip_address, :amount, :user, :company, :card_number, 
        :card_verification, :month, :year, :email, :quote_id, :tax_id, :question, 
        quotes_attributes: [:status, :id]) 
    end
end
