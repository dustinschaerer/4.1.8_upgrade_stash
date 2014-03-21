class LinesController < ApplicationController
  include CurrentCart
  include CurrentQuoteholder
  before_action :set_quoteholder, only: [:create]
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # GET /lines
  # GET /lines.json
  def index
    @lines = Line.all
    
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
  end

  # GET /lines/new
  def new
    @line = Line.new
    @qp_id = (params[:quote_product_id])
    qp = QuoteProduct.find(@qp_id)
    @qp_name = qp.name




    
  end

  # GET /lines/1/edit
  def edit
  end

  # POST /lines
  # POST /lines.json
  def create
    # quote_product = QuoteProduct.find(params[:quote_product_id])
    @qp_id = (params[:quote_product_id])
    @line = @quoteholder.lines.build(line_params)
    #@line = Line.new(line_params)

    respond_to do |format|
      if @line.save
        format.html { redirect_to @line.quoteholder, notice: 'Line was successfully created and added to your Quoteholder.' }
        format.json { render action: 'show', status: :created, location: @line }
      else
        format.html { render action: 'new' }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  def update
    respond_to do |format|
      if @line.update(line_params)
        format.html { redirect_to @line, notice: 'Line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    @line.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Line was successfully removed from your Quote.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:quote_product_id, :length, :width, :height, :cover_id, :series_id, :color_id, :shape_id, :umbrella, :velcro, :yards, :size_id, :quantity, :price)
    end
end
