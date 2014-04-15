class PurchasesController < ApplicationController
  include CurrentQuote
  include CurrentCart
  before_action :set_quote
  before_action :set_cart
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, unless: :current_admin_user

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @quote = Quote.find(params[:quote_id])
    @purchase.firstname = @quote.firstname
    @purchase.lastname = @quote.lastname
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
    
  end

  # GET /purchases/1/edit
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
         
    @purchase = Purchase.new(purchase_params)

    # Add purchase ref to lines
    @purchase.add_lines_from_quote(@quote)   

      
    if @purchase.save
      if @purchase.purchase_the_order
        
        #send purchase notification email    
        PurchaseNotifier.confirmation(@purchase).deliver
        
        render :action => 'success' 

      else
        
        render :action => 'failure'

      end     
       
#      respond_to do |format|
#        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @purchase }
#      end
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
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end

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
        :card_verification, :month, :year)
    end
end
