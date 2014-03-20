class QuoteProductsController < ApplicationController
  before_action :set_quote_product, only: [:show, :edit, :update, :destroy]

  # GET /quote_products
  # GET /quote_products.json
  def index
    @quote_products = QuoteProduct.all
  end

  # GET /quote_products/1
  # GET /quote_products/1.json
  def show
  end

  # GET /quote_products/new
  def new
    @quote_product = QuoteProduct.new
  end

  # GET /quote_products/1/edit
  def edit
  end

  # POST /quote_products
  # POST /quote_products.json
  def create
    @quote_product = QuoteProduct.new(quote_product_params)

    respond_to do |format|
      if @quote_product.save
        format.html { redirect_to @quote_product, notice: 'Quote product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quote_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @quote_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_products/1
  # PATCH/PUT /quote_products/1.json
  def update
    respond_to do |format|
      if @quote_product.update(quote_product_params)
        format.html { redirect_to @quote_product, notice: 'Quote product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quote_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_products/1
  # DELETE /quote_products/1.json
  def destroy
    @quote_product.destroy
    respond_to do |format|
      format.html { redirect_to quote_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_product
      @quote_product = QuoteProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_product_params
      params.require(:quote_product).permit(:name, :group)
    end
end
