class OrderNotifier < ActionMailer::Base
  default from: 'ken@americo-inc.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: 'Americo Swatch Order Confirmation'
  end

  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Americo Swatch Order Shipped'
  end

  def notify_admin(order)
    @order = order
    mail to: "ken@americo-inc.com", subject: 'New Order received on Americo Dashboard'
  end
end
