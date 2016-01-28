class RemoveUsersIndexFromPosts < ActiveRecord::Migration
  def change
    remove_index :posts, column: :users_id
  end
end
