Rails.application.routes.draw do

  root             'static_pages#home'

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
  
  resources :staffs
  
  resources :blogposts
  
  resources :podcasts
  get 'pod_shows' => 'podcasts#shows'
  
  resources :shows
  
  resources :events
  get 'promo' => 'events#promo'
  
  get 'hq'   => 'back_end_pages#main'
  get 'carousel'   => 'back_end_pages#add_carousel'
  get 'mancar'   => 'back_end_pages#manage_car'
  
  resources :articles,          only: [:new, :show, :create, :destroy, :edit, :update]
  get 'news'  => 'articles#news'
  get 'sports'  => 'articles#sports'
  get 'station_news'  => 'articles#station_news'
  
  resources :images,          only: [:create, :index, :destroy, :update]
  
end