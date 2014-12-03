require 'test_helper'

class EventsEditTest < ActionDispatch::IntegrationTest
  def setup
    @event = events :secretsanta
  end

  test "invalid edit with bad title" do
    patch event_path(@event), event: {
      title: ''
    }
    assert flash.empty?
    assert_template 'events/edit'
    assert_select 'div#error_explanation'
  end

  test "valid edit" do
    get edit_event_path(@event)
    assert_template 'events/edit'
    patch event_path(@event), event: {
      participants_attributes: {
        '1' => { name: 'a',
                 email: 'a@example.com',
                 _destroy: 'false'
               },
        '2' => { name: 'b',
                 email: 'b@example.com',
                 _destroy: 'false'
               }
      }
    }
    follow_redirect!
    assert_not flash.empty?
    assert_template 'events/show'
  end
end
