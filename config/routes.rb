Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :bookings
  namespace :user do resources :rvs end
  resources :rvs, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
