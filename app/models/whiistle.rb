class Whiistle < ApplicationRecord
  validates :body, length: { minimum: 3 }

  belongs_to :user
  scope :descending_order, -> { order(created_at: :desc) }
  scope :created_by, ->(users_ids) { where('user_id IN (?)', users_ids) }
end
