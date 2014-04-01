require 'test_helper'

class QuoteNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = QuoteNotifier.received
    assert_equal "Received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "priced" do
    mail = QuoteNotifier.priced
    assert_equal "Priced", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
