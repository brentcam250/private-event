Rails.application.routes.draw do
  resources :events
  resources :users
  resources :sessions, only: [:new, :create, :edit, :destroy] 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#sign_in'
  root 'users#index'
end
