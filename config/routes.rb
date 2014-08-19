Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  namespace :admin do
    resources :posts, :categories
    root to: 'posts#index'
  end
  namespace 'api', defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index, :show]
    end
  end

  get '/auth/failure'            => 'admin/sessions#failure',
    as: :auth_failure
  get '/auth/:provider'          => 'admin/sessions#create',
    as: :login
  get '/auth/:provider/callback' => 'admin/sessions#create',
    as: :auth_callback
  delete '/logout'               => 'admin/sessions#destroy',
    as: :logout

  root 'api/v1/posts#index'
end
