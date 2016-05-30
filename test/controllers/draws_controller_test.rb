require 'test_helper'

class DrawsControllerTest < ActionController::TestCase

  def setup
    @event = events :secretsanta
  end

  test "show the draw creation page" do
    get :show, params: { event_id: @event }
    assert_redirected_to(new_event_draw_url(@event))
  end

  test "create a draw" do
    get :new, params: { event_id: @event }
    assert_response :success
    delta = @event.participants.size
    assert_difference '@event.draws(force_reload: true).size', delta do
      patch :update, params: { event_id: @event }
    end
    assert_not flash.empty?
    assert_redirected_to @event

    get :new, params: { event_id: @event }
    assert_redirected_to :event_draw, event_id: @event

    get :show, params: { event_id: @event }
    assert_response :success

    assert_no_difference '@event.draws(force_reload: true).size' do
      patch :update, params: { event_id: @event }
    end
  end

  test "impossible draw" do
    event = events :impossible
    get :new, params: { event_id: event }
    patch :update, params: { event_id: event }
    assert_redirected_to event
    assert_match(/not be satisfied/, flash[:danger])
  end
end
