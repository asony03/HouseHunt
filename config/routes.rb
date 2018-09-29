Rails.application.routes.draw do
  resources :house_styles
  get 'welcome/index'
  resources :real_estate_companies
  root 'welcome#index'
end
