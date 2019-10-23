Rails.application.routes.draw do

  
  resources :favorites
  root 'welcome#index'

  get 'about/invention', to: 'about#invention'
  get '/signup', to: 'accounts#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'
  get '/sessions/accountable_form', to: 'sessions#accountable_form'
  post '/sessions/accountable_form', to: 'accounts#create_from_fb'

  post '/investors/:investor_id/ideas/:idea_id/favorites/new', to: 'favorites#create'
  match 'unfavorite', to: 'favorites#unfavorite', via: :delete
  # patch '/investors/:investor_id/ideas/:id', to: 'investors#add_to_favorites'

  # get '/auth/failure', to: redirect('/'), via: [:get, :post]
  

  # get 'auth/google-oauth2/callback', to: 'sessions#googleAuth'
  # get 'auth/failure', to: redirect('/')

  post '/ideas/:id/comments/new', to: 'comments#create'

  resources :inventors do
    resources :ideas
  end
  
  resources :investors do
    resources :ideas do
      resources :favorites
    end  
  end  
  

  resources :ideas do
    resources :comments
  end

  resources :investors
  resources :inventors
  resources :accounts
  

  resources :comments
  resources :groups
  resources :ideas
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
