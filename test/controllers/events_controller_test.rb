require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @event = events :secretsanta
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "show event" do
    get :show, id: @event
    assert_select "a[href=?]", event_draw_path(@event)
  end
end
