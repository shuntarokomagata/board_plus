# frozen_string_literal: true

Rails.application.routes.draw do
  get 'photos', to: 'photos#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    # authenticated :user do
    #  root :to => 'my_threads#index', as: :authenticated_root
    # end
    # unauthenticated :user do
    root to: 'users/sessions#new', as: :unauthenticated_root
    # end
    # post '/users/sign_up', to: 'users/registrations#create'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :my_threads do
    resources :comments
  end
end

# devise_for :users, :controllers => {
#:registrations => 'users/registrations',
#:sessions => 'users/sessions',
#:passwords => "users/passwords"
# }
