class AddIndexToGames < ActiveRecord::Migration[5.1]
  def change
    add_index :games, [:user_id, :created_at]
  end
end
