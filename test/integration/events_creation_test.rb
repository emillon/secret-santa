require 'test_helper'

class EventsCreationTest < ActionDispatch::IntegrationTest
  test "invalid event creation" do
    get new_event_path
    assert_no_difference 'Event.count' do
      post events_path, event: { title:  "" }
    end
    assert_template 'events/new'
    assert_select 'div#error_explanation'
  end
end
