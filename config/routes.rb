Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  # resources :cocktails, only: [:index, :new, :create, :show]
  resources :cocktails, only: [:index, :new, :create, :show] do
    resources :doses, only: [:create, :destroy]
  end
  resources :cocktails do
    resources :reviews, only: [:create]
  end
end
