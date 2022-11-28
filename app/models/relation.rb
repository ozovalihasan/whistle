class Relation < ApplicationRecord
  validates :following_id, uniqueness: { scope: :followed_id}
  validate :user_and_followed_unique

  
  belongs_to :following, class_name: "User"
  belongs_to :followed, class_name: "User"

  scope :descending_order, -> { order(created_at: :desc) }

  def user_and_followed_unique
    errors.add(:base, 'Users cannot follow themselves') if user_id == followed_id
  end
end
