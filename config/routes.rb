Rails.application.routes.draw do
  devise_for :users
  
  get 'customer/signup', :to => 'customers#new'
  get 'business/signup', :to => 'businesses#new'
  get 'search', :to => 'customers#search'
  root 'dashboard#index'
  
  resources :dashboard
  resources :customers do
    member do
      get :business_search
    end
  end
  resources :businesses
end
