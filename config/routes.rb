Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "home" => "static_pages#top", as: :home_root
  root "static_pages#top"
  get "home/about" => "static_pages#about", as: :about
  get "users/sign_up" => "users#new", as: :new_user
  
  resources :users, only: %i[index create show edit update] do
    member do
      get 'following'
      get 'followers'
    end
  end
  resources :books
  resources :favorites, only: %i[create destroy]
  resources :book_comments, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
