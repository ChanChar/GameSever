class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :game_length
      t.timestamps null: false
    end

    add_index :games, :title, unique: true
  end
end
