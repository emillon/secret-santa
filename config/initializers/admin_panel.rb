# true => /admin without being authed
Rails.application.config.x.admin_panel_insecure = false
# if user or password is nil, any login attempt will fail
Rails.application.config.x.admin_panel_user = nil
Rails.application.config.x.admin_panel_password = nil
