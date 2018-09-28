Rails.application.routes.draw do
  get 'welcome/index'
  resources :real_estate_companies
  root 'welcome#index'
end
