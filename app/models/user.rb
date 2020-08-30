class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :username, uniqueness: true, presence: true
  validates :fullname, presence: true

  has_one_attached :profile_picture
  has_one_attached :cover_image
  has_many :whiistles, -> { descending_order }, dependent: :destroy

  has_many :following_relations, dependent: :destroy, class_name: 'Following', foreign_key: 'user_id'
  has_many :followings, through: :following_relations, source: :follower
  has_many :followed_relations, -> { descending_order }, dependent: :destroy, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :followed_relations, source: :following

  def followings_and_user_ids
    followings.ids << id
  end

  def whiistles_including_users
    Whiistle.of_followings_and(self).includes(:user)
  end

  def suggested_users
    User.where('id NOT IN (?)', followings_and_user_ids)
  end
end
