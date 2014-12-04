Rails.application.routes.draw do
  root 'static_pages#home'

  get 'events/:id/draw', to: 'events#draw'

  resources :events do
    resource :draw
  end
end
