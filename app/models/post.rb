class Post < ActiveRecord::Base

  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, :description, presence: true

end
