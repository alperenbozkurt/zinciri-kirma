Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :chains do
    resources :rings
    resources :comments
  end
  get '/:username', to: 'users#index', as: 'profile'
  resources :relationships
end
