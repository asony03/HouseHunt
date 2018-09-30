Rails.application.routes.draw do
  get 'sign_up/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  patch  '/login',   to: 'sessions#update'
  delete '/logout',  to: 'sessions#destroy'
  resources :inquiries
  resources :houses
  resources :users
  resources :house_styles
  resources :real_estate_companies
  get 'welcome/index'
  root 'sessions#new'
  get 'potential_buyer/mark_interested'
  get 'potential_buyer/mark_uninterested'
end
