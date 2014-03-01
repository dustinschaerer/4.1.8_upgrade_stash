class NonslippadsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_nonslippad, only: [:show, :edit, :update, :destroy]

  # GET /nonslippads
  # GET /nonslippads.json
  def index
    @nonslippads = Nonslippad.all
  end

  # GET /nonslippads/1
  # GET /nonslippads/1.json
  def show
  end

  # GET /nonslippads/new
  def new
    @nonslippad = Nonslippad.new
  end

  # GET /nonslippads/1/edit
  def edit
  end

  # POST /nonslippads
  # POST /nonslippads.json
  def create
    @nonslippad = Nonslippad.new(nonslippad_params)

    respond_to do |format|
      if @nonslippad.save
        # add this nonslippad quoteitem to quotecart
        @item = @quotecart.add_quoteitem(@nonslippad.id, "nonslippad")  
        #save the item
        @item.save 

        format.html { redirect_to '/request_quote', notice: 'Nonslippad was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nonslippad }
      else
        format.html { render action: 'new' }
        format.json { render json: @nonslippad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nonslippads/1
  # PATCH/PUT /nonslippads/1.json
  def update
    respond_to do |format|
      if @nonslippad.update(nonslippad_params)
        format.html { redirect_to @nonslippad, notice: 'Nonslippad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nonslippad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nonslippads/1
  # DELETE /nonslippads/1.json
  def destroy
    @nonslippad.destroy
    respond_to do |format|
      format.html { redirect_to nonslippads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nonslippad
      @nonslippad = Nonslippad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nonslippad_params
      params.require(:nonslippad).permit(:quantity, :width, :price)
    end
end
