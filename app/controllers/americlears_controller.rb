class AmericlearsController < ApplicationController
  include CurrentCart
  include CurrentQuoteholder
  before_action :set_cart
  before_action :set_quoteholder
  before_action :set_americlear, only: [:show, :edit, :update, :destroy]

  # GET /americlears
  # GET /americlears.json
  def index
    @americlears = Americlear.all
  end

  # GET /americlears/1
  # GET /americlears/1.json
  def show
  end

  # GET /americlears/new
  def new
    @americlear = Americlear.new
  end

  # GET /americlears/1/edit
  def edit
  end

  # POST /americlears
  # POST /americlears.json
  def create
    @americlear = Americlear.new(americlear_params)

    respond_to do |format|
      if @americlear.save
        # add this americlear quoteitem to quotecart
        @item = @quotecart.add_quoteitem(@americlear.id, "americlear")  
        #save the item
        @item.save

        format.html { redirect_to '/request_quote', notice: 'Americlear Quote Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @americlear }
      else


        format.html { render action: 'new' }
        format.json { render json: @americlear.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /americlears/1
  # PATCH/PUT /americlears/1.json
  def update
    respond_to do |format|
      if @americlear.update(americlear_params)
        format.html { redirect_to @americlear, notice: 'Americlear was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @americlear.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /americlears/1
  # DELETE /americlears/1.json
  def destroy
    @americlear.destroy
    respond_to do |format|
      format.html { redirect_to americlears_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_americlear
      @americlear = Americlear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def americlear_params
      params.require(:americlear).permit(:quantity, :yards, :wide, :price)
    end
end
