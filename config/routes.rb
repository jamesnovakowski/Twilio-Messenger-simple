Rails.application.routes.draw do
  get 'welcome/index'

  resources :messages, only: [:welcome, :index, :new, :create]

  root 'welcome#index'
end
