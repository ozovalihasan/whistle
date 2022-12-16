class BaseWhiistle < ApplicationRecord
  validates :body, length: { minimum: 3, message: 'of your whiistle cannot be shorter than 3 letters' }
  
  has_many_attached :pictures do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  
  has_many :quoted_whiistles, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :rewhiistles, foreign_key: "whiistle_id", dependent: :destroy
  has_many :likes, foreign_key: "whiistle_id", dependent: :destroy
  belongs_to :user, counter_cache: :whiistles_count

  scope :descending_order, -> { order(created_at: :desc) }
  scope :created_by, ->(users_ids) { where('user_id IN (?)', users_ids) }
  scope :of_followings_and, ->(user) { created_by(user.followings_and_user_ids).descending_order }
  scope :own_and_rewhiistled_whiistles, ->(user) { joins(:rewhiistles).where("base_whiistles.user_id= ? OR rewhiistles.user_id = ?", user.id, user.id)}
  scope :own_and_rewhiistled_whiistles_without_replies, -> (user) { own_and_rewhiistled_whiistles(user).where.not(type: types["Reply"]) }

  enum type: {
    'Whiistle' => 0,
    'Reply' => 1,
    'QuotedWhiistle' => 2,
  }
end
