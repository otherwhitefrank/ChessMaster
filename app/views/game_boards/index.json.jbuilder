json.array!(@game_boards) do |game_board|
  json.extract! game_board, :id, :set_of_pieces, :list_of_moves, :winner, :loser, :user_id_1, :user_id_2, :active?, :turn
  json.url game_board_url(game_board, format: :json)
end
