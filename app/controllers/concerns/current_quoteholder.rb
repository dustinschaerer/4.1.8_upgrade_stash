module CurrentQuoteholder
	extend ActiveSupport::Concern

	private
	
		def set_quoteholder
	      @quoteholder = Quoteholder.find(session[:quoteholder_id])
	    rescue ActiveRecord::RecordNotFound
	      @quoteholder = Quoteholder.create
	      session[:quoteholder_id] = @quoteholder.id
	    end
end






