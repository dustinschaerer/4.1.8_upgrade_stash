module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title ="Americo"    
    if page_title.empty?
      base_title
    else  
      "#{base_title} | #{page_title}"
    end
  end

  def hidden_div_if(condition, attributes = {}, &block)
  	if condition
  	  attributes["style"] = "display: none"
  	end
  	content_tag("div", attributes, &block)
  end
  
  def boolean_to_words(value)
    value ? "Yes" : "No"
  end

  def subscriber_form
    subscriber = Subscriber.new
    raw render 'shared/subscriber_form', :subscriber => subscriber
  end
  
end