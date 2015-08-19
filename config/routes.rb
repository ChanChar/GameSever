Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get '/start/:username/:game', to: 'games#start_game', as: 'start_game'
    resources :games, only: [:index, :create]
    resources :users, only: [:index, :create]
  end
end
