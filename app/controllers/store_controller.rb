class StoreController < ApplicationController
  include CurrentCart
  include CurrentQuotecart
  before_action :set_cart, only: [:create]
  before_action :set_quotecart, only: [:create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
  	@categories = Category.order(:name)
  	@products = Product.order(:title)
    @series = Series.order(:name)
    @styles = Style.order(:name)
    @colors = Color.order(:name)

  end
end
