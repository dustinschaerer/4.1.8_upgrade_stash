class LaminatesController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart
  before_action :set_quotecart
  before_action :set_laminate, only: [:show, :edit, :update, :destroy]

  # GET /laminates
  # GET /laminates.json
  def index
    @laminates = Laminate.all
  end

  # GET /laminates/1
  # GET /laminates/1.json
  def show
  end

  # GET /laminates/new
  def new
    @laminate = Laminate.new
    # series that belong laminates
    @series = Series.where("style_id = 3").order("name")
    @color = Color.all
  end

  # GET /laminates/1/edit
  def edit
  end

  # POST /laminates
  # POST /laminates.json
  def create
    @laminate = Laminate.new(laminate_params)

    respond_to do |format|
      # if this new vinyl object is saved
      if @laminate.save
        # add this laminate quoteitem to quotecart
        @item = @quotecart.add_quoteitem(@laminate.id, "laminate")
        # save item in quotecart
        @item.save

        format.html { redirect_to @item, notice: 'Laminate Item for Quote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @laminate }
      else
        format.html { render action: 'new' }
        format.json { render json: @laminate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laminates/1
  # PATCH/PUT /laminates/1.json
  def update
    respond_to do |format|
      if @laminate.update(laminate_params)
        format.html { redirect_to @laminate, notice: 'Laminate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @laminate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laminates/1
  # DELETE /laminates/1.json
  def destroy
    @laminate.destroy
    respond_to do |format|
      format.html { redirect_to laminates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laminate
      @laminate = Laminate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laminate_params
      params.require(:laminate).permit(:cover, :shape, :width, :length, :height, :diameter, :drop, :series_id, :color_id, :umbrella, :velcro, :quantity, :price)
    end
end
