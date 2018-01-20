Rails.application.routes.draw do
  resources :sessions, only: %i(index create destroy)

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
