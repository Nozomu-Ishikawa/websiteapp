Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users/home#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :users do
    resources :notices, only: %i[index]
    resources :articles, only: %i[index show]
  end

  resources :reviews, except: %i[new] do
    resources :likes, only: %i[create destroy]
  end

  resources :games, except: %i[destroy] do
    resources :bookmarks, only: %i[create destroy]
    resources :completions, only: %i[create destroy]
  end

  namespace :users do
    resources :profiles, only: %i[show]
  end

  resources :ranking, only: %i[index]

  namespace :myaccount do
    get :reviews
    get :bookmarks
    get :events
    get :charts
    get :profile
    get :email
    get :password
  end

  scope :myaccount do
    resources :dashboard, only: %i[index]
    resources :events, only: %i[create destroy]
    resources :profiles, only: %i[update]
    resources :email, only: %i[update]
    # resources :password, only: %i[update]
  end
end
