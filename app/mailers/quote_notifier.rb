class QuoteNotifier < ActionMailer::Base
  default from: 'staff@americo-test.us'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.quote_notifier.received.subject
  #

  def received(quote, current_user)
    @quote = quote
    @current_user = current_user
    mail to: quote.email, subject: 'Americo Quote Confirmation'
  end

  def priced(quote, current_user)
    @quote = quote
    @current_user = current_user
    mail to: quote.email, subject: 'Pricing Complete on Americo Quote'
  end
end