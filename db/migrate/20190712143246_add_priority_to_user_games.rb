class AddPriorityToUserGames < ActiveRecord::Migration[5.1]
  def change
    add_column :user_games, :priority, :string
  end
end
