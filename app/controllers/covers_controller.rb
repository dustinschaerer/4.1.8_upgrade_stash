class CoversController < ApplicationController
  before_action :authenticate_admin_user! 
  before_action :set_cover, only: [:show, :edit, :update, :destroy]

  # GET /covers
  # GET /covers.json
  def index
    @covers = Cover.all
  end

  # GET /covers/1
  # GET /covers/1.json
  def show
  end

  # GET /covers/new
  def new
    @cover = Cover.new
  end

  # GET /covers/1/edit
  def edit
  end

  # POST /covers
  # POST /covers.json
  def create
    @cover = Cover.new(cover_params)

    respond_to do |format|
      if @cover.save
        format.html { redirect_to @cover, notice: 'Cover was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cover }
      else
        format.html { render action: 'new' }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covers/1
  # PATCH/PUT /covers/1.json
  def update
    respond_to do |format|
      if @cover.update(cover_params)
        format.html { redirect_to @cover, notice: 'Cover was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covers/1
  # DELETE /covers/1.json
  def destroy
    @cover.destroy
    respond_to do |format|
      format.html { redirect_to covers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @cover = Cover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_params
      params.require(:cover).permit(:name)
    end
end
