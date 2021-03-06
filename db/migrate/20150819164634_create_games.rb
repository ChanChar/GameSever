class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.timestamps null: false
    end

    add_index :games, :title, unique: true
  end
end
