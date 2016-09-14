Rails.application.routes.draw do
  get 'welcome/index'

  resources :messages, only: [:new, :create]

  root 'welcome#index'
end
