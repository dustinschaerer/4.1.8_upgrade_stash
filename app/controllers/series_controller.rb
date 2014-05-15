class SeriesController < ApplicationController
  before_action :authenticate_admin_user!, :except => [:show]
  include CurrentQuoteholder
  include CurrentCart
  before_action :set_quoteholder
  before_action :set_cart
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  # GET /series
  def index
   # @series = Series.where("style_id = '7'").order("name")
   @series = Series.all.order(:id)
  end

  # GET /series/1
  def show
  end

  # GET /series/new
  def new
    @series = Series.new
    @styles = Style.all
  end

  # GET /series/1/edit
  def edit
    @series = Series.find(params[:id])
    @styles = Style.all
  end

  # POST /series
  def create
    @series = Series.new(series_params)

    if @series.save
      redirect_to @series, notice: 'Series was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /series/1
  def update
    if @series.update(series_params)
      redirect_to @series, notice: 'Series was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /series/1
  def destroy
    @series.destroy
    redirect_to series_index_url, notice: 'Series was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def series_params
      params.require(:series).permit(:style_id, :name, :description, :image_url, :swapimage, :smallimage, :lead, :callout, :vertical, :horizontal, :side )
    end
end
