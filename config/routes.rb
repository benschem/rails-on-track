Rails.application.routes.draw do
  root to: 'habits#index'
  devise_for :users
  resources :habits
end
