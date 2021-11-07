Rails.application.routes.draw do
  resources :tasks

  get '/login',  to: 'sessions#new',     as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/callback', to: 'sessions#create'
end
