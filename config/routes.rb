Rails.application.routes.draw do
  resources :categories

  root 'home#index'
end
