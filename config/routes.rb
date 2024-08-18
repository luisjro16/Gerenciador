Rails.application.routes.draw do
  root "employees#index"
  
  resources :employees
  resources :positions
  resources :departments
end
