class SubscriberNotification < ActionMailer::Base
  default from: 'ken@americo-inc.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_notification.new_signup.subject
  #
  def new_signup(subscriber)
    @subscriber = subscriber

    mail to: subscriber.email, subject: 'Americo Subscription Notice'
  end

end
