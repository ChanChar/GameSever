json.game_stats do
  json.array!(@games) do |game|
    json.partial! 'api/games/game', game: game
  end
end
