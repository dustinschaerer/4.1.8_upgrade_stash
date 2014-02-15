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

  def cleaning_instructions
  end

  def how_to_measure
  end

  def how_to_order
  end

  def technical_specs
  end
  
  def terms_and_conditions
  end
end
