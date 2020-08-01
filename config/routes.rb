Rails.application.routes.draw do
  devise_for :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "restaurants#index"
  resources :restaurants do
    collection do
      get 'search'
    end
  end
  resources :restaurants, only: [:show, :update]
  resources :drinks, only: [:index, :new, :create]
end
