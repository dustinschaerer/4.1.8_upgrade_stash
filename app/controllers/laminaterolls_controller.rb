class LaminaterollsController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_laminateroll, only: [:show, :edit, :update, :destroy]

  # GET /laminaterolls
  # GET /laminaterolls.json
  def index
    @laminaterolls = Laminateroll.all
  end

  # GET /laminaterolls/1
  # GET /laminaterolls/1.json
  def show
  end

  # GET /laminaterolls/new
  def new
    @laminateroll = Laminateroll.new
    @series = Series.where("style_id = 3").order("name")
    @color = Color.all
  end

  # GET /laminaterolls/1/edit
  def edit
  end

  # POST /laminaterolls
  # POST /laminaterolls.json
  def create
    @laminateroll = Laminateroll.new(laminateroll_params)

    respond_to do |format|
      if @laminateroll.save
        # add this vinyl quoteitem to quotecart
        @item = @quotecart.add_quoteitem(@laminateroll.id, "laminateroll")  
        #save the item
        @item.save

        format.html { redirect_to '/request_quote', notice: 'Laminateroll Item for Quote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @laminateroll }
      else
        format.html { render action: 'new' }
        format.json { render json: @laminateroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laminaterolls/1
  # PATCH/PUT /laminaterolls/1.json
  def update
    respond_to do |format|
      if @laminateroll.update(laminateroll_params)
        format.html { redirect_to @laminateroll, notice: 'Laminateroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @laminateroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laminaterolls/1
  # DELETE /laminaterolls/1.json
  def destroy
    @laminateroll.destroy
    respond_to do |format|
      format.html { redirect_to laminaterolls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laminateroll
      @laminateroll = Laminateroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laminateroll_params
      params.require(:laminateroll).permit(:quantity, :series_id, :color_id, :price)
                                            
    end
end
