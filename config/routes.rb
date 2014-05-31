Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
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

  resources :categories, only: [], path: '' do
    resources :posts, only: :index, path: ''
    get '/:year/:month/:day/:id' => 'posts#show', as: :post
  end

  root 'posts#home'
end
