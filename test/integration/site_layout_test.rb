require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', new_event_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'title', 'Secret Santa creator'

    get new_event_path
    assert_template 'events/new'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', new_event_path
    assert_select 'a[href=?]', help_path
    assert_select 'title', 'Secret Santa creator'
  end
end
