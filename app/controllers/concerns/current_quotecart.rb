module CurrentQuotecart
	extend ActiveSupport::Concern

	private
	
		def set_quotecart
			@quotecart = Quotecart.find(session[:quotecart_id])
		rescue ActiveRecord::RecordNotFound
			@quotecart = Quotecart.create
			session[:quotecart_id] = @quotecart.id
		end
end
