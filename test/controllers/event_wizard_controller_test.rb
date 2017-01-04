require 'test_helper'

class EventWizardControllerTest < ActionDispatch::IntegrationTest
  test "info should set basic info" do
    post event_wizard_info_url, params: {title: 'title'}
    assert_equal @event.title, 'title'
  end

  test "should get participants" do
    get event_wizard_participants_url
    assert_response :success
  end

  test "should get constraints" do
    get event_wizard_constraints_url
    assert_response :success
  end

  test "should get confirm" do
    get event_wizard_confirm_url
    assert_response :success
  end

end
