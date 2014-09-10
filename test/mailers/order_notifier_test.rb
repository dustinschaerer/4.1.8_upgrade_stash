require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:orders_one))
    assert_equal "Americo Swatch Order Confirmation", mail.subject
    assert_equal ["tim@example.org"], mail.to
    assert_equal ["ken@americo-inc.com"], mail.from
    assert_match /Thank you for considering Americo products./, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:orders_one))
    assert_equal "Americo Swatch Order Shipped", mail.subject
    assert_equal ["tim@example.org"], mail.to
    assert_equal ["ken@americo-inc.com"], mail.from
    assert_match /This notification is to let you know that we've shipped your recent Sample Swatch order containing/, mail.body.encoded
  end

end