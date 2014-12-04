require 'test_helper'

class DrawMailerTest < ActionMailer::TestCase
  test "gift" do
    break
    mail = DrawMailer.gift
    assert_equal "Gift", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
