class CreateLeaderBoards < ActiveRecord::Migration
  def change
    create_table :leader_boards do |t|
      t.array :high_users

      t.timestamps
    end
  end
end
