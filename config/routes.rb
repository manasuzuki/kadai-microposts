Rails.application.routes.draw do
 root to:'toppages#index'
 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 #見栄えを考慮してloginとlogoutと名付けている
 
 get 'signup', to: 'users#new'
 resources :users, only: [:index, :show, :new, :create]
 
 resources :microposts, only:  [:create, :destroy]
end
