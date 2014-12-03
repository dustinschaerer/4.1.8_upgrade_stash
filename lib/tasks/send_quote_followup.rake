desc "send quote followup email"
task :send_quote_followup => :environment do

	# target date = how many days to look back at submitted quotes
	target_date = 4.days.ago
	target_quotes = []
	target_quotes = Quote.where(created_at: target_date.beginning_of_day..target_date.end_of_day)
	uniqued = target_quotes.group_by(&:email).map{|k, v| v.first}
	uniqued.each do |quote|
	   	# send message to this email
		QuoteNotifier.quote_followup(quote).deliver
	end
end