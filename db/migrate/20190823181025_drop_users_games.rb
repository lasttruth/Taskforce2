class DropUsersGames < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_games

  end
end
