Fels3::Application.routes.draw do
<<<<<<< HEAD
  resources :users do
    resources :lessons, only: [:new, :show, :index]
  end

=======
  resources :users
>>>>>>> export/import CSV
  resources :words
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources "sessions", only: [:new, :create, :destroy]
    resources :users
    resources :words
    resources :categories
    match "csvs", to: "csvs#index", via: :get
    match "csvs/import", to: "csvs#import", via: :post
    match "csvs/export", to: "csvs#export", via: :get
    match "/signin", to: "sessions#new", via: "get"
    match "/signout", to: "sessions#destroy", via: "delete"
  end

  resources :categories, only: [:new, :show, :index]
  resources :lessons
  resources :results, only: [:new, :show, :index]
  
  root  'static_pages#home'
  match "csvs", to: "csvs#index", via: :get
  match "csvs/export", to: "csvs#export", via: :get
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
    
end