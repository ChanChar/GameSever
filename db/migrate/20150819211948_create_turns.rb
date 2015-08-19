class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :play_token_id, null: false
      t.string :directions, null: false

      t.timestamps null: false
    end

    add_index :turns, :play_token_id
  end
end
