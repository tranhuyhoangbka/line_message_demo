Rails.application.routes.draw do
  resources :books
  devise_for :users
  root to: 'books#index'
  post '/webhook', to: 'webhooks#create'
  get '/link_account', to: 'link_accounts#show'
end
