Rails.application.routes.draw do
  devise_for :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    collection do
      get 'search'
    end
  end
  resources :restaurants, only: [:index, :show, :edit, :update]
  resources :drinks, only: [:new, :create, :destroy]
  resources :foods, only: [:new, :create]
  resources :sakes, only: [:new, :create]
  resources :wines, only: [:new, :create] 
  root "restaurants#index"
end
