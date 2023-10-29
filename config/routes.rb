Rails.application.routes.draw do

  root to: 'homes#top'

  namespace :admin do
    resources :users, only: [:edit, :index, :show, :update, :destroy]
    resources :posts, only: [:edit, :index, :show, :update, :destroy]
    resources :genres, only: [:new, :edit, :index, :create, :update]
  end

  namespace :public do
    resources :users, only: [:show]
    resources :posts, only: [:new, :edit, :create, :index, :show, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
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
