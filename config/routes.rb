Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root 'posts#index'
  resources :users, only: %i[index show]
  resources :posts, only: %i[index new create] do
    resources :comments, only: %i[new create]
  end
  resources :profiles, only: %i[edit update]
  resources :friend_requests, only: %i[create update]
  resources :likes, only: %i[create destroy]
end
