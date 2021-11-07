Rails.application.routes.draw do
  get '/login',  to: 'sessions#new',     as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/doorkeeper/callback', to: 'sessions#create'

  resources :tasks, except: %i[edit update destroy] do
    post :assign, on: :collection
    post :complete, on: :member
  end
end
