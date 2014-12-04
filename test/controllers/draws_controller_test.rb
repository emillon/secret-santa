require 'test_helper'

class DrawsControllerTest < ActionController::TestCase

  def setup
    @event = events :secretsanta
    @event.participants << participants(:santa)
    @event.participants << participants(:michel)
    @event.participants << participants(:bob)
  end

  test "show the draw creation page" do
    get :show, event_id: @event
    assert_redirected_to(new_event_draw_url(@event))
  end

  test "create a draw" do
    get :new, event_id: @event
    assert_response :success
    assert_difference '@event.draws(force_reload: true).size', 3 do
      post :create, event_id: @event
    end
    assert_not flash.empty?
    assert_redirected_to @event
  end
end
