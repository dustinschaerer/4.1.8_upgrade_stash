class PurchaseNotifier < ActionMailer::Base
  default from: 'staff@americo-inc.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_notifier.confirmation.subject
  #
  def confirmation(purchase)
    @purchase = purchase

    mail to: purchase.user.email, subject: 'Americo Purchase Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_notifier.shipped.subject
  #
  def shipped(purchase)
    @purchase = purchase

    mail to: purchase.user.email, subject: 'Americo Purchase has Shipped'
  end
end
