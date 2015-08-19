class CreatePlayTokens < ActiveRecord::Migration
  def change
    create_table :play_tokens do |t|
      t.string :token, null: false
      t.integer :user_id, null: false
      t.integer :game_id, null: false
      t.boolean :won, default: false, null: false
      t.datetime :expire_at, null: false

      t.timestamps null: false
    end

    add_index :play_tokens, :user_id
    add_index :play_tokens, :game_id
  end
end
