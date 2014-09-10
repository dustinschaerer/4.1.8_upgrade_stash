require 'test_helper'

class SubscriberNotificationTest < ActionMailer::TestCase
=begin
  test "new_signup" do
    mail = SubscriberNotification.new_signup
    assert_equal "Americo Subscription Notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
=end


end
