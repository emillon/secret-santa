require 'test_helper'

class DrawTest < ActiveSupport::TestCase
  test "draws record when they are sent" do
    secretsanta = events :secretsanta
    santa = participants :santa
    santaswife = participants :santas_wife
    draw = Draw.new(event: secretsanta, giver: santa, receiver: santaswife)
    assert_nil draw.sent_at
    draw.send_email
    assert_not_nil draw.sent_at
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
end
