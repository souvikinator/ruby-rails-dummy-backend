class RemoveDateCreatedFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :date_created, :datetime
  end
end
