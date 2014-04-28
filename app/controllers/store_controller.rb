class StoreController < ApplicationController
  include CurrentCart
  include CurrentQuoteholder
  before_action :set_cart
  before_action :set_quoteholder 
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
  	@categories = Category.order(:name)
  	@products = Product.order(:title)
    @series = Series.order(:name)
    @styles = Style.order(:name)
    @colors = Color.order(:name)

  end
end
