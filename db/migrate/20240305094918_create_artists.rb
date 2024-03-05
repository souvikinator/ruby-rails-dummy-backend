class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.integer :song_count
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :artists, :users, column: :user_id
  end
end
