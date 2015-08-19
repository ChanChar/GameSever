Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, paths: '/' do
    get '/start/:username/:game', to: 'games#create_token', as: 'create_token'
    resources :games, only: [:index, :create]
    resources :users, only: [:index, :create]
  end
end
