Rails.application.routes.draw do

  resources :investors
  resources :inventors
  resources :accounts
  
  root 'welcome#index'

  resources :comments
  resources :groups
  resources :ideas
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
