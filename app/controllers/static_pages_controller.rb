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

  def photo_gallery
  end

  def markets
  end

  def frequently_asked_questions
  end


end
