Rails.application.routes.draw do
  namespace :admin do
    resources :posts, :categories
    root to: 'posts#index'
  end

  get '/auth/failure'            => 'admin/sessions#failure',
    as: :auth_failure
  get '/auth/:provider'          => 'admin/sessions#create',
    as: :login
  get '/auth/:provider/callback' => 'admin/sessions#create',
    as: :auth_callback
  delete '/logout'               => 'admin/sessions#destroy',
    as: :logout

  resources :posts, only: [:index, :show]

  resources :categories, only: [:show]

  root 'posts#index'
end
