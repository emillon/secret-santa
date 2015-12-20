require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @event = events :secretsanta
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "#event_locale option" do |options|
      assert_equal 2, options.length
    end
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

  test "displays number of participants" do
    get :show, id: @event
    h2 = css_select "h2"
    participants_text = h2[0].text
    number_of_participants = @event.participants.length.to_s
    assert participants_text.include?(number_of_participants)
  end

  test "validates email" do
    get :edit, id: @event
    assert_select 'input[type=email]' do |inputs|
      assert_equal @event.participants.length, inputs.length
    end
  end

end
