class StoreController < ApplicationController
  include CurrentCart
  include CurrentQuoteholder
 
  def index
  	@categories = Category.order(:name)
  	@products = Product.order(:title)
    @series = Series.order(:name)
    @styles = Style.order(:name)
    @colors = Color.order(:name)

  end
end
