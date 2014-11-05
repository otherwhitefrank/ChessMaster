class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.integer :game_id
      t.integer :white_game_timer
      t.integer :black_game_timer
      t.datetime :timestamp

      t.timestamps
    end
  end
end
