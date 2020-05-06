require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "welcome_user" do
    mail = OrderMailer.welcome_user
    assert_equal "Welcome user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_confirmation" do
    mail = OrderMailer.order_confirmation
    assert_equal "Order confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_delivered" do
    mail = OrderMailer.order_delivered
    assert_equal "Order delivered", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
