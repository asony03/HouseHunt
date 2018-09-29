Rails.application.routes.draw do
  resources :houses
  resources :users
  resources :house_styles
  get 'welcome/index'
  resources :real_estate_companies
  root 'welcome#index'
end
