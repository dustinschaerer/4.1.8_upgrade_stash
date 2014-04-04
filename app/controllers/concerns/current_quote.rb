module CurrentQuote
	extend ActiveSupport::Concern

	private
	
		def set_quote
			@quote = Quote.find(session[:quote_id])
		rescue ActiveRecord::RecordNotFound
			@quote = Quote.find(params[:quote_id])
			session[:quote_id] = @quote.id
			#redirect_to root_url, notice: "That Quote does not exist"
		end

end
