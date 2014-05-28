Rails.application.routes.draw do
  resources :posts

  resources :categories

  root 'home#index'
end
