class Recipe < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :recipe
  belongs_to :user

  scope :of_followed_users, -> (following_users) {where user_id: following_users}

  has_many :comments

  # def self.search(search)
  #
  #   where("title ILike ?", "%#{search}%")
  # end

end
