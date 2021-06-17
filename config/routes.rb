Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
 # get 'homes#index'
  get 'about' => 'homes#index'
#  path 'top' => 'books#index'
  resources :users
  resources :books
  post 'users' => 'users#create'
  #post 'books' => 'books#create'
  post 'users/:id' => 'books#show'
  end
