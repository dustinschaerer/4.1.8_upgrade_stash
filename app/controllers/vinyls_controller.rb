class VinylsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /vinyls
  # GET /vinyls.json
  def index
    @vinyls = Vinyl.all
  end

  # GET /vinyls/1
  # GET /vinyls/1.json
  def show
  end

  # GET /vinyls/new
  def new
    #if session[:vinyl]
    #  @vinyl = Vinyl.new(params[:vinyl])
    #else 
      @vinyl = Vinyl.new
      @series = Series.where("style_id = 1 OR style_id = 2").order("name")
 #     @color = Color.all  
 #    @cover = Cover.all
 #     @shape = Shape.all
    #end 
  end

  # GET /vinyls/1/edit
  def edit
      @cover = Cover.all
      @shape = Shape.all
      @series = Series.where("style_id = 1 OR style_id = 2").order("name")
      @color = Color.all  

  end    

  # POST /vinyls
  # POST /vinyls.json
  def create
    @vinyl = Vinyl.new(vinyl_params)

    respond_to do |format|
      # if this new vinyl object is saved
      if @vinyl.save
        # add this vinyl quoteitem to quotecart
        @item = @quotecart.add_quoteitem(@vinyl.id, "vinyl")
        @item.save
        
        format.html { redirect_to '/request_quote', notice: 'Vinyl Item for Quote was successfully created.' }
        ####################################
        # NEEDED: if ajax call rerender current page
        ####################################
        format.js {}
        format.json { render action: 'show', status: :created, location: @vinyl }
      else
        format.html { render action: 'new' }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinyls/1
  # PATCH/PUT /vinyls/1.json
  def update
    respond_to do |format|
      if @vinyl.update(vinyl_params)
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinyls/1
  # DELETE /vinyls/1.json
  def destroy
    @vinyl.destroy
    respond_to do |format|
      format.html { redirect_to vinyls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vinyl_params
      params.require(:vinyl).permit(:cover_id, :shape_id, :width, :length, :diameter, :height, :drop, :series_id, :color_id, :umbrella, :velcro, :quantity, :price)
    end
end
