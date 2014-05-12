class StylesController < ApplicationController
  before_action :authenticate_admin_user!, :except => [:show] 
  include CurrentQuoteholder
  include CurrentCart
  before_action :set_quoteholder
  before_action :set_cart
  before_action :set_style, only: [:show, :edit, :update, :destroy]

  # GET /styles
  def index
    @styles = Style.all
  end

  # GET /styles/1
  def show
    @style = Style.friendly.find(params[:id])
  end

  # GET /styles/new
  def new
    @style = Style.new
    @products = Product.all
  end

  # GET /styles/1/edit
  def edit
    @style = Style.find(params[:id])
    @products = Product.all
  end

  # POST /styles
  def create
    @style = Style.new(style_params)

    if @style.save
      redirect_to @style, notice: 'Style was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /styles/1
  def update
    if @style.update(style_params)
      redirect_to @style, notice: 'Style was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /styles/1
  def destroy
    @style.destroy
    redirect_to styles_url, notice: 'Style was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_style
      @style = Style.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def style_params
      params.require(:style).permit(:product_id, :title, :name, :description, :image_url, :sort)
    end
end
