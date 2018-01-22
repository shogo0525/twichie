Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: %i(create destroy)
  resources :home
  resources :posts, only: %i(show)
  resources :comments, only: %i(create)

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
