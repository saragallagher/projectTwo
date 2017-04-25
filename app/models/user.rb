class User < ApplicationRecord
  has_secure_password
  validates :user_name, presence: true, length: {minimum: 4, maximum: 16}
  has_many :recipes
  has_many :comments
end
