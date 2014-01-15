class StaticPagesController < ApplicationController
  def home
  	@subscriber = Subscriber.new
  end

  def help
  end

  def about
  end

  def contact
  end
end
