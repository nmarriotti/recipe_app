Rails.application.routes.draw do
  resources :friends
  resources :recipes do
    resources :comments
  end
  devise_for :users
  root 'pages#index'
  get 'main', to: 'main#index'
  get 'search', to: 'users#search'
end
