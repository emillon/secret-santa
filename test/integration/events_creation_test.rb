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

  test "valid event creation" do
    get new_event_path
    assert_difference 'Event.count', 1 do
      post events_path, event: { title:  "Secret Santa at my place" }
    end
    follow_redirect!
    assert_template 'events/show'
  end
end
