Rails.application.routes.draw do
  devise_for :users
  root to: 'habits#index'
  resources :habits, except: [:show, :new]
end
