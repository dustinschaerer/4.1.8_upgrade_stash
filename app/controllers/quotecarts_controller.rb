class QuotecartsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /quotecarts
  # GET /quotecarts.json
  def index
    @quotecarts = Quotecart.all
  end

  # GET /quotecarts/1
  # GET /quotecarts/1.json
  def show
    @quotecart if @quotecart.id == session[:quotecart_id]
  end

  # GET /quotecarts/new
  def new
    @quotecart = Quotecart.new
  end

  # GET /quotecarts/1/edit
  def edit
  end

  # POST /quotecarts
  # POST /quotecarts.json
  def create
    @quotecart = Quotecart.new(quotecart_params)

    respond_to do |format|
      if @quotecart.save
        format.html { redirect_to @quotecart, notice: 'Quotecart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quotecart }
      else
        format.html { render action: 'new' }
        format.json { render json: @quotecart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotecarts/1
  # PATCH/PUT /quotecarts/1.json
  def update
    respond_to do |format|
      if @quotecart.update(quotecart_params)
        format.html { redirect_to @quotecart, notice: 'Quotecart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quotecart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotecarts/1
  # DELETE /quotecarts/1.json
  def destroy
    @quotecart.destroy if @quotecart.id == session[:quotecart_id]
    session[:quotecart_id] = nil

    respond_to do |format|
      format.html { redirect_to store_url, notice: 'Your Quote Cart is now Empty, You no longer have a quote to submit.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotecart
      @quotecart = Quotecart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotecart_params
      params[:quotecart]
    end
end
