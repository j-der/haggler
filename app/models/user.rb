class User < ActiveRecord::Base

  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "must follow email format" }
  validates :username, presence: true

  def liked?(post_id)
    likes.where(post_id: post_id).any?
  end

end 
