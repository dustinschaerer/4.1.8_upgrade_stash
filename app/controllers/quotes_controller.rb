class QuotesController < ApplicationController

  before_action :authenticate_admin_user!, :except => [:new, :create, :show, :edit, :update]
  include CurrentCart
  include CurrentQuoteholder
  before_action :set_quoteholder
  before_action :set_cart
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, unless: :current_admin_user

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
    # make sure users only see their own quotes
    # look up the user attached to quote
    if (@quote.user_id) == (current_user.id)
      # only show this quote if it belongs to the signed in user
    else
      redirect_to root_url, notice: "The quote you tried to access does not belong to you."
    end
  end

  # GET /quotes/new
  def new
    #if @quotecart.items.empty?
    if @quoteholder.lines.empty?
      redirect_to '/request_quote', notice: "Please add items to your Quote before submitting it."
    end
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
     if (@quote.user_id) == (current_user.id)
      # only edit this quote if it belongs to the signed in user
    else
      redirect_to root_url, notice: "You must sign in to edit your quote."
    end
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    @quote.user_id = current_user.id
    # @quote.add_items_from_quotecart(@quotecart)
    ########################
    #  Add functionality here to add lines to quoteholder
    #########################
    @quote.add_lines_from_quoteholder(@quoteholder)

    respond_to do |format|
      if @quote.save
        Quoteholder.destroy(session[:quoteholder_id])
        session[:quoteholder_id] = nil
        QuoteNotifier.received(@quote, current_user).deliver
        QuoteNotifier.notify_admin(@quote).deliver
        format.html { redirect_to user_path(current_user), notice: %Q[Your Quote was successfully created and submitted. You should receive a confirmation email letting you know we've recieved your quote right away. We will also send you a notification email as soon as we finish pricing your Quote. <p>Don't forget to join our Mailing List for special offers and periodic newsletters. <a target="new" href="http://visitor.r20.constantcontact.com/d.jsp?llr=j4rb9sqab&amp;p=oi&amp;m=1117322790889&amp;sit=8wpamrxib&amp;f=7e954c51-d956-4ceb-b3be-2a8cf6773713" class="button btn btn-success" style="color: rgb(255, 255, 255);  text-shadow: none; border-top-left-radius: 10px; border-top-right-radius: 10px; border-bottom-right-radius: 10px; border-bottom-left-radius: 10px; display:inline-block; vertical-align: middle;">Join our Mailing List here.</a>].html_safe }
        format.json { render action: 'show', status: :created, location: @quote }
      else
        format.html { render action: 'new' }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_path(@quote), notice: 'Quote was successfully updated.' }
        format.json { head :no_content }
        #format.json { respond_with_bip(@quote) }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @quote.errors, status: :unprocessable_entity }
        #format.json { respond_with_bip(@quote) }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:user_id, :firstname, :lastname, :company, :email, :status, :telephone, :contactby, :ship_street_address, :ship_city, :ship_state, :ship_zipcode, :ship_country, :subtotal, :shipping, :sales_tax, :total, :pay_type, :id, :tax_id, :question,
        lines_attributes: [:id, :price, :quantity])
    end
end
