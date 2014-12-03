module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title ="Vinyl Table Covers, Upholstery and Laminated Fabric | Americo Inc."
    if page_title.empty?
      base_title
    else
      "#{page_title}"
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

  def full_description(page_description)
    base_description ="Americo"
    if page_description.empty?
      base_description
    else
      "#{page_description}"
    end
  end

  def full_keywords(page_keywords)
    base_keywords ="Americo"
    if page_keywords.empty?
      base_keywords
    else
      "#{base_keywords} | #{page_keywords}"
    end
  end

end