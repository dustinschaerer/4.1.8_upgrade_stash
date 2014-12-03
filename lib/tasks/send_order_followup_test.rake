desc "send order followup test"
task :send_order_followup_test => :environment do
	# target date = how many days to look back for sending for swatch/catalog orders
	target_date = 5.days.ago
	target_orders = []
	target_orders = Order.where(created_at: target_date.beginning_of_day..target_date.end_of_day)
	# puts target_orders
	# target_orders.each do |order|
		#puts order.email
	# end
	uniqued = target_orders.group_by(&:email).map{|k, v| v.first}
	uniqued.each do |order|
    # puts order.email
    # send message to this email
		OrderNotifier.order_followup(order).deliver
	end
end