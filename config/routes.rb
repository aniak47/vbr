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
  
  get 'addstaff'  => 'staffs#new'
  resources :staffs
  
  resources :blogposts,          only: [:create, :destroy, :index]
  
  resources :specialty_shows
  
  resources :events
  get 'promo' => 'events#promo'
  
  get 'hq'   => 'back_end_pages#main'
  get 'postblog'   => 'back_end_pages#blog'
  get 'addStaff'   => 'back_end_pages#add_staff'
  get 'editProfile'   => 'back_end_pages#edit_profile'
  
  resources :blogposts,          only: [:new, :show, :create, :destroy, :edit]
  get 'news'  => 'articles#news'
  get 'sports'  => 'articles#sports'
  get 'station_news'  => 'articles#station_news'
  
  
end