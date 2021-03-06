Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount SwaggerEngine::Engine, at: '/api-docs'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :projects, only: [:index, :show, :edit, :update, :new, :create, :destroy]

  root to: 'home#index'
end
