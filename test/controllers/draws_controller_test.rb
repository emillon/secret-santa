require 'test_helper'

class DrawsControllerTest < ActionController::TestCase

  def setup
    @event = events :secretsanta
    @event.participants << participants(:santa)
    @event.participants << participants(:michel)
    @event.participants << participants(:bob)
  end

  test "create a draw" do
    get :new, event_id: @event.id
    assert_response :success
  end
end
