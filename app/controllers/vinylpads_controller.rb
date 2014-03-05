class VinylpadsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_vinylpad, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /vinylpads
  # GET /vinylpads.json
  def index
    @vinylpads = Vinylpad.all
  end

  # GET /vinylpads/1
  # GET /vinylpads/1.json
  def show
  end

  # GET /vinylpads/new
  def new
    @vinylpad = Vinylpad.new
  end

  # GET /vinylpads/1/edit
  def edit
  end

  # POST /vinylpads
  # POST /vinylpads.json
  def create
    @vinylpad = Vinylpad.new(vinylpad_params)

    respond_to do |format|
      if @vinylpad.save

        @item = @quotecart.add_quoteitem(@vinylpad.id, "vinylpad")
        @item.save
        
        format.html { redirect_to '/request_quote', notice: 'Vinylpad item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vinylpad }
      else
        format.html { render action: 'new' }
        format.json { render json: @vinylpad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinylpads/1
  # PATCH/PUT /vinylpads/1.json
  def update
    respond_to do |format|
      if @vinylpad.update(vinylpad_params)
        format.html { redirect_to @vinylpad, notice: 'Vinylpad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vinylpad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinylpads/1
  # DELETE /vinylpads/1.json
  def destroy
    @vinylpad.destroy
    respond_to do |format|
      format.html { redirect_to vinylpads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinylpad
      @vinylpad = Vinylpad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vinylpad_params
      params.require(:vinylpad).permit(:quantity, :price)
    end
end
