class ChangeUserIdInArtist < ActiveRecord::Migration[6.1]
  def change
    change_column_null :artists, :user_id, false
  end
end
