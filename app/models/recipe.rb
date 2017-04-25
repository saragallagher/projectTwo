class Recipe < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  scope :of_followed_users, -> (following_users) {where user_id: following_users}
=======
  has_many :comments
>>>>>>> comments
end
