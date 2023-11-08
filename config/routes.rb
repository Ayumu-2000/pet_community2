Rails.application.routes.draw do
  resources :posts, only: [:show]
  root to: 'homes#top'

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:edit, :index, :show, :update, :destroy]
    resources :posts, only: [:edit, :index, :show, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :genres, only: [:new, :edit, :show, :index, :create, :update]
  end

  namespace :public do
    root to: 'homes#top'
    resources :users, only: [:show]
    resources :posts, only: [:new, :edit, :create, :index, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get "search" => "searches#search"
  end

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
