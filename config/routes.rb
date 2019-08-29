Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :games

  end

  get 'game/search', to: 'games#search', as: 'game_search'
  get 'games/:game_id/statuses/new', to: 'statuses#new', as: 'new_game_status'
  post 'games/:game_id/statuses/new', to: 'statuses#create' 
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
