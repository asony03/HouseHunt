Rails.application.routes.draw do
  get 'sign_up/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :inquiries
  resources :houses
  resources :users
  resources :house_styles
  get 'welcome/index'
  resources :real_estate_companies
  root 'sessions#new'

  get '/:page' => 'static#show'
end
