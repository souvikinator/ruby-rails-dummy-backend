class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :about
      t.integer :artist_id
      t.bigint :likes
      t.bigint :streams

      t.timestamps
    end

    add_foreign_key :songs, :artists, column: :artist_id
    change_column_null :songs, :name, false
    change_column_null :songs, :artist_id, false
    change_column_default :songs, :likes, 0
    change_column_default :songs, :streams, 0

  end
end
