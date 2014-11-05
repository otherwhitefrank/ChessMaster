class CreateGameBoards < ActiveRecord::Migration
  def change
    create_table :game_boards do |t|
      t.array :set_of_pieces
      t.array :list_of_moves
      t.string :winner
      t.string :loser
      t.string :user_id_1
      t.string :user_id_2
      t.boolean :active?
      t.integer :turn

      t.timestamps
    end
  end
end
