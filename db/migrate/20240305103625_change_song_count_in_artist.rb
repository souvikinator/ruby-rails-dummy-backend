class ChangeSongCountInArtist < ActiveRecord::Migration[6.1]
  def change
    change_column_default :artists, :song_count, 0
  end
end
