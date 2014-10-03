Rails.application.routes.draw do
  get 'reports/index'

  devise_for :users
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#create'
end
