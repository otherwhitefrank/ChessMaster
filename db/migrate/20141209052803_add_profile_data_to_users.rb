class AddProfileDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :about, :string
  end
end
