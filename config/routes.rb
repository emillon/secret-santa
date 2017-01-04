Rails.application.routes.draw do
  get 'event_wizard/info'
  post 'event_wizard/info' => 'event_wizard#post_info'

  get 'event_wizard/participants'

  get 'event_wizard/constraints'

  get 'event_wizard/confirm'

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  root 'static_pages#home'

  get '/help' => 'static_pages#help'

  resources :events do
    resource :draw
  end
end
