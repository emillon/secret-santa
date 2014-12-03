require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new(title: "title")
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "invalid title" do
    @event.title = "   "
    assert_not @event.valid?
  end
end
