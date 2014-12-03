require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  def setup
    @participant = participants :santa
    @event = events :secretsanta
  end

  test "should be valid" do
    assert @participant.valid?
    assert @event.valid?
  end

  test "create participant with invalid name" do
    @participant.name = ''
    assert_not @participant.valid?
  end

  test "create participant with invalid email" do
    @participant.email = ''
    assert_not @participant.valid?
    @participant.email = 'foo'
    assert_not @participant.valid?
  end

  test "events are created with 0 participant" do
    assert_equal 0, @event.participants.size
  end

  test "add a participant" do
    assert_difference '@event.participants.size', 1 do
      @event.participants << @participant
    end
  end
end
