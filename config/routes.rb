Rails.application.routes.draw do
  resources :checklists
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :performances, only: [ :index, :create ]
  resources :lots, only: [ :index, :create, :new, :edit, :update, :destroy ]
  resources :recipes
  resources :checklists
  resources :menu, only: [ :index ]
  resources :products
  resources :suppliers

end
