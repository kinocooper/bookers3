Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"homes#top", as:'root'
  get "home/about"=>"homes#about", as:'home_about'
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only:[:create,:destroy]
    resources :book_comments, only:[:create,:destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationship, only: [:create,:destroy]
  end

  get "relationship/followers_index/:user_id" => "relationships#followers_index", as:'followers_index'
  get "relationship/followeds_index/:user_id" => "relationships#followeds_index", as:'followeds_index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end