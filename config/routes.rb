Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    post '/new_game', to: 'play_tokens#create', as: 'new_game'
    post '/play/:token', to: 'games#play_turn', as: 'play_game'
    resources :games, only: [:index, :create]
    resources :users, only: [:index, :create]
  end
end
