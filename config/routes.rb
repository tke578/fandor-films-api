require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, :only => [:index, :show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
      resources :films, :only => [:show, :index] do
        resources :film_ratings, :only => [:index, :show, :create]
      end
    end
  end
end
