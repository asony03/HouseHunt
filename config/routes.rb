Rails.application.routes.draw do
  resources :inquiries
  resources :houses
  resources :users
  resources :house_styles
  get 'welcome/index'
  resources :real_estate_companies
  root 'welcome#index'

  get '/:page' => 'static#show'
end
