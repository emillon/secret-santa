require 'test_helper'

class EventsHelperTest < ActionView::TestCase
  def setup
    @event = events :secretsanta
  end

  test "draw is fair" do
    @event.participants << participants(:santa)
    @event.participants << participants(:michel)
    @event.participants << participants(:bob)

    assert_equal 3, @event.participants.size
    draw = draw_order @event

    def receives_a_gift(draw, p)
      draw.any? { | (giver, receiver) | receiver == p }
    end

    def makes_a_gift(draw, p)
      draw.any? { | (giver, receiver) | receiver == p }
    end

    for p in @event.participants
      assert(receives_a_gift(draw, p))
      assert(makes_a_gift(draw, p))
    end

    for (giver, receiver) in draw
      assert_not_equal giver, receiver
    end
  end
end
