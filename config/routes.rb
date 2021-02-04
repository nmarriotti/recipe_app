Rails.application.routes.draw do
  devise_for :users, :paths => 'users'
  resources :friends
  resources :users do
    resources :recipes do
      resources :comments
    end
  end
  
  root 'pages#index'
  get 'main', to: 'main#index'
  get 'search', to: 'recipes#search'
  get 'recipes', to: 'recipes#all'
end
