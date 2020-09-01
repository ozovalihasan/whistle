class Following < ApplicationRecord
  validates :user_id, uniqueness: { scope: :followed_id, case_sensitive: false }
  validate :user_and_followed_unique

  belongs_to :follower, class_name: 'User', foreign_key: 'followed_id'
  belongs_to :following, class_name: 'User', foreign_key: 'user_id'

  scope :descending_order, -> { order(created_at: :desc) }

  def user_and_followed_unique
    errors.add(:base, 'Users cannot follow themselves') if user_id == followed_id
  end
end
