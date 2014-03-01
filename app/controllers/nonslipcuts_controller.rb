class NonslipcutsController < ApplicationController
  include CurrentQuotecart
  include CurrentCart
  before_action :set_quotecart
  before_action :set_cart
  before_action :set_nonslipcut, only: [:show, :edit, :update, :destroy]

  # GET /nonslipcuts
  # GET /nonslipcuts.json
  def index
    @nonslipcuts = Nonslipcut.all
  end

  # GET /nonslipcuts/1
  # GET /nonslipcuts/1.json
  def show
  end

  # GET /nonslipcuts/new
  def new
    @nonslipcut = Nonslipcut.new
  end

  # GET /nonslipcuts/1/edit
  def edit
  end

  # POST /nonslipcuts
  # POST /nonslipcuts.json
  def create
    @nonslipcut = Nonslipcut.new(nonslipcut_params)

    respond_to do |format|
      if @nonslipcut.save

         # add this quoteitem to quotecart
        @item = @quotecart.add_quoteitem(@nonslipcut.id, "nonslipcut")  
        @item.save
        
        format.html { redirect_to '/request_quote', notice: 'Nonslipcut was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nonslipcut }
      else
        format.html { render action: 'new' }
        format.json { render json: @nonslipcut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nonslipcuts/1
  # PATCH/PUT /nonslipcuts/1.json
  def update
    respond_to do |format|
      if @nonslipcut.update(nonslipcut_params)
        format.html { redirect_to @nonslipcut, notice: 'Nonslipcut was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nonslipcut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nonslipcuts/1
  # DELETE /nonslipcuts/1.json
  def destroy
    @nonslipcut.destroy
    respond_to do |format|
      format.html { redirect_to nonslipcuts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nonslipcut
      @nonslipcut = Nonslipcut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nonslipcut_params
      params.require(:nonslipcut).permit(:quantity, :inches_wide, :inches_long, :price)
    end
end
