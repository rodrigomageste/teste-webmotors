Rails.application.routes.draw do
  resources :models, only: :index

  root to: 'home#index'
end
