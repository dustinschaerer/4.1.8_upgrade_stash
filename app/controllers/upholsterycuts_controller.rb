class UpholsterycutsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_upholsterycut, only: [:show, :edit, :update, :destroy]

  # GET /upholsterycuts
  # GET /upholsterycuts.json
  def index
    @upholsterycuts = Upholsterycut.all
  end

  # GET /upholsterycuts/1
  # GET /upholsterycuts/1.json
  def show
  end

  # GET /upholsterycuts/new
  def new
    @upholsterycut = Upholsterycut.new
    @series = Series.where("style_id = 1 OR style_id = 2").order("name")
    @color = Color.where("style_id = 7")
  end

  # GET /upholsterycuts/1/edit
  def edit
  end

  # POST /upholsterycuts
  # POST /upholsterycuts.json
  def create
    @upholsterycut = Upholsterycut.new(upholsterycut_params)

    respond_to do |format|
      if @upholsterycut.save
        format.html { redirect_to @upholsterycut, notice: 'Upholsterycut was successfully created.' }
        format.json { render action: 'show', status: :created, location: @upholsterycut }
      else
        format.html { render action: 'new' }
        format.json { render json: @upholsterycut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upholsterycuts/1
  # PATCH/PUT /upholsterycuts/1.json
  def update
    respond_to do |format|
      if @upholsterycut.update(upholsterycut_params)
        format.html { redirect_to @upholsterycut, notice: 'Upholsterycut was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upholsterycut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upholsterycuts/1
  # DELETE /upholsterycuts/1.json
  def destroy
    @upholsterycut.destroy
    respond_to do |format|
      format.html { redirect_to upholsterycuts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upholsterycut
      @upholsterycut = Upholsterycut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upholsterycut_params
      params.require(:upholsterycut).permit(:quantity, :series_id, :color_id, :price, :yards_long)
    end
end
