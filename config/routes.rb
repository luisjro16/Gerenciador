Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions'}, skip: [:registrations]
  root "users#show"
  
  resources :admin_users
  resources :users
  resources :employees
  resources :positions
  resources :departments
end
