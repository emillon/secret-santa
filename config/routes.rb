Rails.application.routes.draw do
  root 'static_pages#home'

  get '/help' => 'static_pages#help'

  resources :events do
    resource :draw
  end
end
