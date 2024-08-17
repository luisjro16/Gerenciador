Rails.application.routes.draw do
  root "users#index"
  
  resources :users
  resources :positions
  resources :departments
end
