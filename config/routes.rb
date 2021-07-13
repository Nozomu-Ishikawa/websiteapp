Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :reviews do
    resources :likes
  end

  resources :games do
    resources :bookmarks
    resources :completions
  end

  resources :bookmarks

  namespace :users do
    resources :profiles, only: :show
  end

  resources :ranking, only: %i[index]

end
