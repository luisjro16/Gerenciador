Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  root "home#index"
  
  resources :employees
  resources :positions
  resources :departments
end
