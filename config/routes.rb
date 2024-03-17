Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :habits, except: [:show, :new]
end
