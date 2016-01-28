class User < ActiveRecord::Base

  has_secure_password

  has_many :posts, dependent: :destroy

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "must follow email format" }

end 
