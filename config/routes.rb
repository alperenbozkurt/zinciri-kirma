Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :chains do
    resources :rings
  end
  get '/:username', to: 'users#index', as: 'profile'
end
