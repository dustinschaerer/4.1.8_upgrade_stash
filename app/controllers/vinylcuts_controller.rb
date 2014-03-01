class VinylcutsController < ApplicationController
  include CurrentQuotecart
  include CurrentCart
  before_action :set_quotecart
  before_action :set_cart
  before_action :set_vinylcut, only: [:show, :edit, :update, :destroy]

  # GET /vinylcuts
  # GET /vinylcuts.json
  def index
    @vinylcuts = Vinylcut.all
  end

  # GET /vinylcuts/1
  # GET /vinylcuts/1.json
  def show
  end

  # GET /vinylcuts/new
  def new
    @vinylcut = Vinylcut.new
    @series = Series.where("style_id = 1 OR style_id = 2").order("name")
    @color = Color.where("style_id = 1 OR style_id = 2")
  end

  # GET /vinylcuts/1/edit
  def edit
  end

  # POST /vinylcuts
  # POST /vinylcuts.json
  def create
    @vinylcut = Vinylcut.new(vinylcut_params)

    respond_to do |format|
      if @vinylcut.save
        
        @item = @quotecart.add_quoteitem(@vinylcut.id, "vinylcut")
        @item.save

        format.html { redirect_to '/request_quote', notice: 'Vinylcut was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vinylcut }
      else
        format.html { render action: 'new' }
        format.json { render json: @vinylcut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinylcuts/1
  # PATCH/PUT /vinylcuts/1.json
  def update
    respond_to do |format|
      if @vinylcut.update(vinylcut_params)
        format.html { redirect_to @vinylcut, notice: 'Vinylcut was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vinylcut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinylcuts/1
  # DELETE /vinylcuts/1.json
  def destroy
    @vinylcut.destroy
    respond_to do |format|
      format.html { redirect_to vinylcuts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinylcut
      @vinylcut = Vinylcut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vinylcut_params
      params.require(:vinylcut).permit(:quantity, :yards_long, :series_id, :color_id, :price)
    end
end
