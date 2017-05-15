Rails.application.routes.draw do

  # get 'home/index'

  namespace :api, defaults: { format: :json } do
     resources :users
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
