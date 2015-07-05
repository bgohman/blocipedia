Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :wikis

  devise_for :users

  get 'about' => 'welcome#about'

  resources :charges, only: [:new, :create]
  resources :refunds, only: [:new, :create]

end
