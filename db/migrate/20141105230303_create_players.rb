class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :game_id
      t.integer :wins
      t.integer :losses
      t.string :user_name
      t.integer :user_id

      t.timestamps
    end
  end
end
