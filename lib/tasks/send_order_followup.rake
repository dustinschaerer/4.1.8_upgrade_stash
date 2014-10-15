desc "send order followup email" 
task :send_order_followup => :environment do 

	# target date = how many days to look back at submitted orders
	target_date = 11.days.ago
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