Rails.application.routes.draw do


  resources :messages, only: [:new, :create, :index]

  root             'static_pages#home'
 
  resources :shifts,          only: [:new, :create, :destroy, :edit, :update, :index]
  get 'schedule'  => 'shifts#schedule'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact'   => 'static_pages#contact'
  get 'schedule'   => 'static_pages#schedule'
  get 'songhistory'   => 'static_pages#history'
  get 'lineup'  => 'static_pages#lineup'
  get 'donate'  => 'static_pages#donate'
  get 'advertise'  => 'static_pages#advertise'
  get 'social'  => 'static_pages#social'
  get 'weather'  => 'static_pages#weather'
  get 'rockthewaters'    => 'static_pages#rockthewaters'
  
  resources :staffs
  
  resources :blogposts
  
  resources :podcasts
  get 'pod_shows' => 'podcasts#shows'
  
  resources :shows
  
  resources :events
  get 'promo' => 'events#promo'
  get 'concerts' => 'events#concerts'
  
  get 'hq'   => 'back_end_pages#main'
  get 'carousel'   => 'back_end_pages#add_carousel'
  get 'mancar'   => 'back_end_pages#manage_car'
  get 'manage_staff'   => 'back_end_pages#manage_staff'
  
  resources :articles,          only: [:new, :show, :create, :destroy, :edit, :update]
  get 'news'  => 'articles#news'
  get 'sports'  => 'articles#sports'
  get 'station_news'  => 'articles#station_news'
  
  resources :images,          only: [:create, :index, :destroy, :update]
  
  resources :top_tens
  
  resources :account_activations, only: [:edit, :update]
  
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get '*path', to: 'static_pages#home'
  
end