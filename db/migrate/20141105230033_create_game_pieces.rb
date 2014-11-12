class CreateGamePieces < ActiveRecord::Migration
  def change
    create_table :game_pieces do |t|
      t.string :type
      t.integer :x
      t.integer :y
      t.integer :game_id

      t.timestamps
    end
  end
end
