Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users/home#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
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

end
