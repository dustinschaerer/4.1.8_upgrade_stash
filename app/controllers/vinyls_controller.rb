class VinylsController < ApplicationController
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy]

  # GET /vinyls
  # GET /vinyls.json
  def index
    @vinyls = Vinyl.all
  end

  # GET /vinyls/1
  # GET /vinyls/1.json
  def show
  end

  # GET /vinyls/new
  def new
    @vinyl = Vinyl.new
  end

  # GET /vinyls/1/edit
  def edit
  end

  # POST /vinyls
  # POST /vinyls.json
  def create
    @vinyl = Vinyl.new(vinyl_params)

    respond_to do |format|
      if @vinyl.save
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vinyl }
      else
        format.html { render action: 'new' }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinyls/1
  # PATCH/PUT /vinyls/1.json
  def update
    respond_to do |format|
      if @vinyl.update(vinyl_params)
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinyls/1
  # DELETE /vinyls/1.json
  def destroy
    @vinyl.destroy
    respond_to do |format|
      format.html { redirect_to vinyls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vinyl_params
      params.require(:vinyl).permit(:cover, :shape, :width, :length, :height, :drop, :series_id, :color_id, :umbrella, :velcro, :quantity, :price)
    end
end
