require 'test_helper'

class QuoteNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = QuoteNotifier.received(quotes(:quote_one), users(:user_one))
    assert_equal "Americo Quote Confirmation", mail.subject
    assert_equal ["tim@example.org"], mail.to
    assert_equal ["ken@americo-inc.com"], mail.from
    assert_match /Thank you for your recent Quote submission to Americo./, mail.body.encoded
  end

  test "priced" do
    mail = QuoteNotifier.priced(quotes(:quote_one), users(:user_one))
    assert_equal "Pricing Complete on Americo Quote", mail.subject
    assert_equal ["tim@example.org"], mail.to
    assert_equal ["ken@americo-inc.com"], mail.from
    assert_match /We have finished pricing your recent Quote/, mail.body.encoded
  end

end
