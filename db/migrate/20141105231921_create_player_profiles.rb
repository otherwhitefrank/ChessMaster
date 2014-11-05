class CreatePlayerProfiles < ActiveRecord::Migration
  def change
    create_table :player_profiles do |t|

      t.timestamps
    end
  end
end
