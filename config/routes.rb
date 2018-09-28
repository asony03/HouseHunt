Rails.application.routes.draw do
  resources :users
  get 'welcome/index'
  resources :real_estate_companies
  root 'welcome#index'
end
