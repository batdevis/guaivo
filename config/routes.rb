Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backstage', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount SwaggerEngine::Engine, at: '/api-docs'

  resources :projects, only: [:index, :show]

  root to: 'projects#index'
end
