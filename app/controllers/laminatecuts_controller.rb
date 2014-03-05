class LaminatecutsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_laminatecut, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /laminatecuts
  # GET /laminatecuts.json
  def index
    @laminatecuts = Laminatecut.all
  end

  # GET /laminatecuts/1
  # GET /laminatecuts/1.json
  def show
  end

  # GET /laminatecuts/new
  def new
    @laminatecut = Laminatecut.new
    @series = Series.where("style_id = 3").order("name")
    @color = Color.all
  end

  # GET /laminatecuts/1/edit
  def edit
  end

  # POST /laminatecuts
  # POST /laminatecuts.json
  def create
    @laminatecut = Laminatecut.new(laminatecut_params)

    respond_to do |format|
      if @laminatecut.save

        @item = @quotecart.add_quoteitem(@laminatecut.id, "laminatecut")  
        @item.save

        format.html { redirect_to '/request_quote', notice: 'Laminatecut was successfully created.' }
        format.json { render action: 'show', status: :created, location: @laminatecut }
      else
        format.html { render action: 'new' }
        format.json { render json: @laminatecut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laminatecuts/1
  # PATCH/PUT /laminatecuts/1.json
  def update
    respond_to do |format|
      if @laminatecut.update(laminatecut_params)
        format.html { redirect_to @laminatecut, notice: 'Laminatecut was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @laminatecut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laminatecuts/1
  # DELETE /laminatecuts/1.json
  def destroy
    @laminatecut.destroy
    respond_to do |format|
      format.html { redirect_to laminatecuts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laminatecut
      @laminatecut = Laminatecut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laminatecut_params
      params.require(:laminatecut).permit(:quantity, :yards_long, :series_id, :color_id, :price)
    end
end
