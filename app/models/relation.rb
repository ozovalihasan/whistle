# frozen_string_literal: true

class Relation < ApplicationRecord
  validates :following_id, uniqueness: { scope: :followed_id }
  validate :user_and_followed_unique

  belongs_to :following, class_name: 'User', counter_cache: :followings_count
  belongs_to :followed, class_name: 'User', counter_cache: :followers_count

  scope :descending_order, -> { order(created_at: :desc) }

  def user_and_followed_unique
    errors.add(:base, 'Users cannot follow themselves') if following_id == followed_id
  end
end
