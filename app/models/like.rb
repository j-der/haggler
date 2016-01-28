class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id }

  after_create :post_increment_likes

  private 

  def post_increment_likes
    post.like_count += 1 
    post.save 
  end
   
end 
