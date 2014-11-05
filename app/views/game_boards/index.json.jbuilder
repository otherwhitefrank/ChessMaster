json.array!(@game_boards) do |game_board|
  json.extract! game_board, :id
  json.url game_board_url(game_board, format: :json)
end
