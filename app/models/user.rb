class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy

  validates :email, uniqueness: true
  
end 
