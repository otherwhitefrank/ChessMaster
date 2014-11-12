class CreateGamePieces < ActiveRecord::Migration
  def change
    create_table :game_pieces do |t|
      t.string :piecetype
      t.integer :x
      t.integer :y
      t.integer :type
      t.integer :game_id

      t.timestamps
    end
  end
end
