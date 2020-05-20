# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
class Admin::ApplicationController < Administrate::ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
    if Rails.application.config.x.admin_panel_insecure
      return
    end
    admin_user = Rails.application.config.x.admin_panel_user
    admin_password = Rails.application.config.x.admin_panel_password
    if admin_user.nil? || admin_password.nil?
      head :forbidden
    end
    authenticate_or_request_with_http_basic do |username, password|
      username == admin_user && password == admin_password
    end
  end

end
