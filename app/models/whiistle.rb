class Whiistle < ApplicationRecord
  validates :body, length: { minimum: 3 }
  
  belongs_to :user

  scope :descending_order, -> { order(created_at: :desc) }
  scope :created_by, ->(users_ids) { where('user_id IN (?)', users_ids) }
  scope :of_followings_and, ->(user) { created_by(user.followings_and_user_ids).descending_order }
end
