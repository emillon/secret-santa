require 'test_helper'

class EventsHelperTest < ActionView::TestCase
  def setup
    @event = events :secretsanta
  end

  test "draw is fair" do
    @event.participants << participants(:santa)
    @event.participants << participants(:michel)
    @event.participants << participants(:bob)
    @event.participants << participants(:santas_wife)
    @event.participants << participants(:michels_wife)
    @event.participants << participants(:bobs_wife)

    @event.constraints << Constraint.new(one: participants(:santa), other: participants(:santas_wife))
    @event.constraints << Constraint.new(one: participants(:michel), other: participants(:michels_wife))
    @event.constraints << Constraint.new(one: participants(:bob), other: participants(:bobs_wife))

    assert_equal 6, @event.participants.size
    assert_equal 3, @event.constraints.size
    50.times do
      draw = draw_order @event

      def receives_a_gift(draw, p)
        draw.any? { | (giver, receiver) | receiver == p }
      end

      def makes_a_gift(draw, p)
        draw.any? { | (giver, receiver) | receiver == p }
      end

      def consistent_with_constraints(event, draw, giver, receiver)
        not event.constraints.any? do |c|
          (c.one == giver and c.other == receiver) or (c.one == receiver and c.other == giver)
        end
      end

      for p in @event.participants
        assert(receives_a_gift(draw, p))
        assert(makes_a_gift(draw, p))
      end

      for (giver, receiver) in draw
        assert_not_equal giver, receiver
        consistent = consistent_with_constraints @event, draw, giver, receiver
        assert consistent, "Constraints should not be violated"
      end
    end
  end
end
