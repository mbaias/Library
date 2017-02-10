Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new' 
  resources :favorite_books, only: [:create, :destroy]
  resources :sessions, exception: [:new]
  resources :users, exception: [:new]
  resources :books
  resources :categories
end
