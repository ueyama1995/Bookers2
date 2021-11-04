Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :edit, :create, :index, :show, :update, :destroy] do
  resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end
   resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :users, only: [:index, :show, :edit, :update]
  get 'home/about' => 'homes#about'

end
