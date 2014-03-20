class QuoteholdersController < ApplicationController
  include CurrentCart
  include CurrentQuoteholder
  before_action :set_cart
  before_action :set_quoteholder, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_quoteholder

 
  
  # GET /quoteholders
  # GET /quoteholders.json
  def index
    @quoteholders = Quoteholder.all
  end

  # GET /quoteholders/1
  # GET /quoteholders/1.json
  def show
  end

  # GET /quoteholders/new
  def new
    @quoteholder = Quoteholder.new
  end

  # GET /quoteholders/1/edit
  def edit
  end

  # POST /quoteholders
  # POST /quoteholders.json
  def create
    @quoteholder = Quoteholder.new(quoteholder_params)

    respond_to do |format|
      if @quoteholder.save
        format.html { redirect_to @quoteholder, notice: 'Quoteholder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quoteholder }
      else
        format.html { render action: 'new' }
        format.json { render json: @quoteholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quoteholders/1
  # PATCH/PUT /quoteholders/1.json
  def update
    respond_to do |format|
      if @quoteholder.update(quoteholder_params)
        format.html { redirect_to @quoteholder, notice: 'Quoteholder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quoteholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quoteholders/1
  # DELETE /quoteholders/1.json
  def destroy
    @quoteholder.destroy if @quoteholder.id == session[:quoteholder_id]
    session[:quoteholder_id] = nil
    respond_to do |format|
       
      format.html { redirect_to quote_products_path, notice: 'Your Quote is now empty.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quoteholder
      @quoteholder = Quoteholder.find(params[:id])
    end

    def invalid_quoteholder
      logger.error "Attempt to access invalid quoteholder #{params[:id]}"
      redirect_to root_path, "Invalid Quote Cart"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quoteholder_params
      params[:quoteholder]
    end
end
