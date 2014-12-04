Rails.application.routes.draw do
  root 'static_pages#home'

  resources :events do
    resource :draw
  end
end
