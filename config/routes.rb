Rails.application.routes.draw do
  root 'welcome#index'

  resources :investors
  resources :inventors
  resources :accounts
  

  resources :comments
  resources :groups
  resources :ideas
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
