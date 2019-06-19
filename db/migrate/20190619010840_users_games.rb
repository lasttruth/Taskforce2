class UsersGames < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :games do |t|
    t.index :game_id
    t.index :user_id
  end
  end
end
