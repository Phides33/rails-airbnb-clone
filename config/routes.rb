Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  root to: 'pages#home'

  resources :rvs do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:index]
  get "myrvs", to: 'rvs#my_rvs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
