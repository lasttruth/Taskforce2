class CreateUserGames < ActiveRecord::Migration[5.1]
  def change
    create_table :user_games do |t|

      t.references :user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps
    end
  end
end
