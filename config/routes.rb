Rails.application.routes.draw do
  get "home/index"
  root "home#index"
  
  resources :employees
  resources :positions
  resources :departments
end
