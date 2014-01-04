class ShippingProfilesController < ApplicationController
  before_action :set_shipping_profile, only: [:show, :edit, :update, :destroy]

  # GET /shipping_profiles
  # GET /shipping_profiles.json
  def index
    @shipping_profiles = ShippingProfile.all
  end

  # GET /shipping_profiles/1
  # GET /shipping_profiles/1.json
  def show
  end

  # GET /shipping_profiles/new
  def new
    @shipping_profile = ShippingProfile.new
  end

  # GET /shipping_profiles/1/edit
  def edit
  end

  # POST /shipping_profiles
  # POST /shipping_profiles.json
  def create
    @shipping_profile = ShippingProfile.new(shipping_profile_params)

    respond_to do |format|
      if @shipping_profile.save
        format.html { redirect_to @shipping_profile, notice: 'Shipping profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shipping_profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @shipping_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_profiles/1
  # PATCH/PUT /shipping_profiles/1.json
  def update
    respond_to do |format|
      if @shipping_profile.update(shipping_profile_params)
        format.html { redirect_to @shipping_profile, notice: 'Shipping profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @shipping_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_profiles/1
  # DELETE /shipping_profiles/1.json
  def destroy
    @shipping_profile.destroy
    respond_to do |format|
      format.html { redirect_to shipping_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_profile
      @shipping_profile = ShippingProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_profile_params
      params.require(:shipping_profile).permit(:user_id, :firstname, :lastname, :company, :street_address, :city, :state, :zipcode, :country)
    end
end
