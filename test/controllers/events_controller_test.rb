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

  test "redirects after draw" do
    bob = participants :bob
    michel = participants :michel
    draw = Draw.new giver: bob, receiver: michel
    @event.draws << draw

    get :show, id: @event
    assert_not flash.empty?

    get :edit, id: @event
    assert_redirected_to @event

    patch :update, id: @event, event: {
      locale: :fr
    }
    assert_redirected_to @event
  end
end
