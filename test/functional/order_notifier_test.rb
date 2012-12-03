require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Order confirmation", mail.subject
    assert_equal ["something@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "/1 x Programming Ruby 1.9/", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Order shipped!", mail.subject
    assert_equal ["something@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "/Programming Ruby 1.9/", mail.body.encoded
  end

end
