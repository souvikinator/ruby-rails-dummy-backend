class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :artist_id
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :followers, :artists, column: :artist_id
    add_foreign_key :followers, :artists, column: :user_id
  end
end
