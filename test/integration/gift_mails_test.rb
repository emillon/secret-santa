require 'test_helper'

class GiftMailsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear

    @event = events :secretsanta
    @event.participants << participants(:santa)
    @event.participants << participants(:michel)
    @event.participants << participants(:bob)
    @event.participants << participants(:santas_wife)
    @event.participants << participants(:michels_wife)
    @event.participants << participants(:bobs_wife)

    @event.constraints << Constraint.new(one: participants(:santa), other: participants(:santas_wife))
    @event.constraints << Constraint.new(one: participants(:michel), other: participants(:michels_wife))
    @event.constraints << Constraint.new(one: participants(:bob), other: participants(:bobs_wife))
  end

  test "send mails" do
    assert @event.draws.empty?
    assert_difference '@event.draws(force_reload: true).size', 6 do
      patch event_draw_path(event_id: @event)
    end
    assert_equal 6, ActionMailer::Base.deliveries.size
  end
end
