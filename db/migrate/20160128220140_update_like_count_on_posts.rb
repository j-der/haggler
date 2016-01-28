class UpdateLikeCountOnPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :like_counts, :integer, default: 0
    add_column :posts, :like_count, :integer, default: 0
  end
end
