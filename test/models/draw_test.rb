require 'test_helper'

class DrawTest < ActiveSupport::TestCase
  test "draws record when they are sent" do
    secretsanta = events :secretsanta
    santa = participants :santa
    santaswife = participants :santas_wife
    draw = Draw.new(event: secretsanta, giver: santa, receiver: santaswife)
    assert_nil draw.sent_at
    time = Time.local(2008, 9, 1, 12, 0, 0)
    travel_to time do
      assert_difference 'ActionMailer::Base.deliveries.size', +1 do
        draw.send_email
      end
    end
    assert_equal time, draw.sent_at
  end
end
