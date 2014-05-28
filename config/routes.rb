Rails.application.routes.draw do
  namespace :admin do
    resources :posts, :categories
    root to: 'posts#index'
  end

  resources :posts, only: [:index, :show]

  resources :categories, only: [:show]

  root 'posts#index'
end
