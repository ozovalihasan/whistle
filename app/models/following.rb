# frozen_string_literal: true

class Following < ApplicationRecord
  validates :user_id, uniqueness: { scope: :followed_id, case_sensitive: false }

  belongs_to :follower, class_name: 'User', foreign_key: 'followed_id'
  belongs_to :following, class_name: 'User', foreign_key: 'user_id'
end
