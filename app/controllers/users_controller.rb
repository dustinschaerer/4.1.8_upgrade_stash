class UsersController < ApplicationController
  include CurrentQuotecart
  include CurrentCart
  before_action :set_quotecart
  before_action :set_cart
  
  before_filter :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_user

  def show
    @user = User.find(params[:id])

    if current_user.id == @user.id
      # lookup the orders belonging to this user
      @orders = @user.orders.all
   
      # lookup the quotes belonging to this user
      @quotes = Quote.find_all_by_user_id current_user[:id]
   
    else
      render 'new', notice: 'You tried to access an account that does not belong to you.'
    end 
    
  end



   def invalid_user
      logger.error "Attempt to access inalid user #{params[:id]}"  
      redirect_to store_url, notice: 'You tried to access and Invalid user.'
   end

end
