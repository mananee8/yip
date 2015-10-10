Rails.application.routes.draw do
  devise_for :users
  
  resources :dashboard
  
  get 'customer/signup', :to => 'customers#new'
  get 'business/signup', :to => 'businesses#new'
  root 'dashboard#index'
end
