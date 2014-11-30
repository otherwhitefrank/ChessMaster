class AddUpdatedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :updated_at, :datetime
  end
end
