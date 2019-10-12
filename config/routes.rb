Rails.application.routes.draw do
  resources :groups
  resources :ideas
  resources :investors
  resources :inventors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
