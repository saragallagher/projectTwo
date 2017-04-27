class User < ApplicationRecord
  has_secure_password

  has_many :recipes, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  validates :user_name, presence: true, length: {minimum: 4, maximum: 16}

  has_many :comments, dependent: :destroy

end
