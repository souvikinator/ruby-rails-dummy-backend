class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :bio
      t.datetime :date_created

      t.timestamps
    end
  end
end
