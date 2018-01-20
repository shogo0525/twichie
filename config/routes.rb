Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: %i(create destroy)

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
