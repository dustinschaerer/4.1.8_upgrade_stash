class UpholsteryrollsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_upholsteryroll, only: [:show, :edit, :update, :destroy]

  # GET /upholsteryrolls
  # GET /upholsteryrolls.json
  def index
    @upholsteryrolls = Upholsteryroll.all
  end

  # GET /upholsteryrolls/1
  # GET /upholsteryrolls/1.json
  def show
  end

  # GET /upholsteryrolls/new
  def new
    @upholsteryroll = Upholsteryroll.new
    @series = Series.where("style_id = 7").order("name")
    @color = Color.all
  end

  # GET /upholsteryrolls/1/edit
  def edit
  end

  # POST /upholsteryrolls
  # POST /upholsteryrolls.json
  def create
    @upholsteryroll = Upholsteryroll.new(upholsteryroll_params)

    respond_to do |format|
      if @upholsteryroll.save
        # add this upholsteryroll quoteitem to quotecart
        @item = @quotecart.add_quoteitem(@upholsteryroll.id, "upholsteryroll")  
        #save the item
        @item.save

        format.html { redirect_to @upholsteryroll, notice: 'Upholsteryroll was successfully created.' }
        format.json { render action: 'show', status: :created, location: @upholsteryroll }
      else
        format.html { render action: 'new' }
        format.json { render json: @upholsteryroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upholsteryrolls/1
  # PATCH/PUT /upholsteryrolls/1.json
  def update
    respond_to do |format|
      if @upholsteryroll.update(upholsteryroll_params)
        format.html { redirect_to @upholsteryroll, notice: 'Upholsteryroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upholsteryroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upholsteryrolls/1
  # DELETE /upholsteryrolls/1.json
  def destroy
    @upholsteryroll.destroy
    respond_to do |format|
      format.html { redirect_to upholsteryrolls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upholsteryroll
      @upholsteryroll = Upholsteryroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upholsteryroll_params
      params.require(:upholsteryroll).permit(:quantity, :series_id, :color_id, :price)
    end
end
