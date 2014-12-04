require 'test_helper'

class DrawMailerTest < ActionMailer::TestCase
  test "gift" do
    event = events :secretsanta
    michel = participants :michel
    bob = participants :bob
    draw = Draw.new(event: event, giver: michel, receiver: bob)
    mail = DrawMailer.gift draw
    assert_equal "Secret Santa - gift assignment for Michel", mail.subject
    assert_equal [michel.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match "Hello Michel", mail.html_part.decoded
    assert_match "Hello Michel", mail.text_part.decoded
    assert_match /to.*Bob/m, mail.html_part.decoded
    assert_match /to.*Bob/m, mail.text_part.decoded
  end

end
