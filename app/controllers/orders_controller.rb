class OrdersController < ApplicationController

  before_action :authenticate_admin_user!, :except => [:new, :create, :show] 
  include CurrentQuoteholder
  include CurrentCart
  before_action :set_quoteholder, only: [:new, :create]
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, unless: :current_admin_user

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your cart is empty, you must select a sample swatch to proceed to checkout."
      return
    end
      
    @order = Order.new
    #@order.email = current_user.email
  end

  # GET /orders/1/edit
  def edit
     if (@order.user_id) == (current_user.id)
      # only edit this quote if it belongs to the signed in user
    else   
      redirect_to root_url, notice: "You must sign in to edit your order."
    end  
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        #send email
        OrderNotifier.received(@order).deliver
        OrderNotifier.notify_admin(@order).deliver

        format.html { redirect_to user_path(current_user), notice: 'Your order was successfully created. Thank You for choosing Americo! We will send you an email when your order is ready to ship.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
#        format.json { head :no_content }
        format.json { respond_with_bip(@order) }

      else
        format.html { render action: 'edit' }
 #       format.json { render json: @order.errors, status: :unprocessable_entity }
        format.json { respond_with_bip(@order) }  
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:firstname, :lastname, :company, :street_address, :city, :state, :zipcode, :country, :telephone, :email, :user_id, :status, :question)
    end
end
