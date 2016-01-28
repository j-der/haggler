class RemoveUsersIdColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :users_id, :integer
  end
end
