Rails.application.routes.draw do

  #namespace :api do
  #  get 'items/create'
  #end

  #namespace :api do
  #  get 'lists/create'
  #end


  namespace :api, defaults: { format: :json } do

    resources :users do
      resources :lists
    end

    resources :lists, only: [:update, :create] do
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy, :update]
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
