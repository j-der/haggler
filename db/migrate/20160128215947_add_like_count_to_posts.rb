class AddLikeCountToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :likes, :integer, default: 0
    add_column :posts, :like_counts, :integer, default: 0
  end
end
