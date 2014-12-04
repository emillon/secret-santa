require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  def setup
    @participant = participants :santa
    @event = events :secretsanta
    @other_event = events :thesupersecretsanta
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

  test "Participant names should be unique" do
    p1 = Participant.new(name: 'Bobby', email: 'bobby@example.com')
    p2 = Participant.new(name: 'Bobby', email: 'other_bobby@example.com')
    assert p1.valid?
    assert p2.valid?
    @event.participants << p1
    @event.participants << p2
    assert p1.valid?
    assert_not p2.valid?

    p3 = Participant.new(name: 'Bobby', email: 'yet_another_bobby@example.com')
    assert p3.valid?
    @other_event.participants << p3
    assert p3.valid?
  end
end
