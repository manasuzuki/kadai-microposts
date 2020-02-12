Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do #memberメソッドを使うとユーザーidが含まれているURLを扱えるようになる
      get :followings
      get :followers
    end
    member do
      get :likes #お気に入り一覧
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy] #relationship は中間テーブルなので index や show でユーザに見せるようなリソースではありません。
  resources :favorites, only:[:create, :destroy]
end
