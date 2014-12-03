require 'test_helper'

class EventsEditTest < ActionDispatch::IntegrationTest
  def setup
    @event = events :secretsanta
  end

  test "invalid edit with bad title" do
    get edit_event_path(@event)
    assert_template 'events/edit'
    patch event_path(@event), event: {
      title: ''
    }
    assert flash.empty?
    assert_template 'events/edit'
    assert_select 'div#error_explanation'
  end
end
