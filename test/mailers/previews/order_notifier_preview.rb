class OrderNotifierPreview < ActionMailer::Preview
  def received
    OrderNotifier.received(Order.last)
  end

  def shipped
    OrderNotifier.shipped(Order.last)
  end

  def question
    OrderNotifier.question(Order.last, User.first)
  end

  def notify_admin
    OrderNotifier.notify_admin(Order.last)
  end

  def order_followup
    OrderNotifier.order_followup(Order.last)
  end
end