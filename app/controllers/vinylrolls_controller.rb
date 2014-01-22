class VinylrollsController < ApplicationController
  before_action :set_vinylroll, only: [:show, :edit, :update, :destroy]

  # GET /vinylrolls
  # GET /vinylrolls.json
  def index
    @vinylrolls = Vinylroll.all
  end

  # GET /vinylrolls/1
  # GET /vinylrolls/1.json
  def show
  end

  # GET /vinylrolls/new
  def new
    @vinylroll = Vinylroll.new
  end

  # GET /vinylrolls/1/edit
  def edit
  end

  # POST /vinylrolls
  # POST /vinylrolls.json
  def create
    @vinylroll = Vinylroll.new(vinylroll_params)

    respond_to do |format|
      if @vinylroll.save
        format.html { redirect_to @vinylroll, notice: 'Vinylroll was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vinylroll }
      else
        format.html { render action: 'new' }
        format.json { render json: @vinylroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinylrolls/1
  # PATCH/PUT /vinylrolls/1.json
  def update
    respond_to do |format|
      if @vinylroll.update(vinylroll_params)
        format.html { redirect_to @vinylroll, notice: 'Vinylroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vinylroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinylrolls/1
  # DELETE /vinylrolls/1.json
  def destroy
    @vinylroll.destroy
    respond_to do |format|
      format.html { redirect_to vinylrolls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinylroll
      @vinylroll = Vinylroll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vinylroll_params
      params.require(:vinylroll).permit(:quantity, :references, :references, :price)
    end
end