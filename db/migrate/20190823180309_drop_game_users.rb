class DropGameUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :games_users
  end
end
