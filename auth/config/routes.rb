Rails.application.routes.draw do
  use_doorkeeper
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :accounts do
    get :current, on: :collection
  end
end
