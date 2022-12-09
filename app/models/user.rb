class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
         

  validates :email, uniqueness: { case_sensitive: false }, presence: true        
  validates :username, uniqueness: true, presence: true
  validates :fullname, presence: true

  has_one_attached :profile_picture
  has_one_attached :cover_image

  has_many :quoted_whiistles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :rewhiistles, dependent: :destroy
  has_many :whiistles, dependent: :destroy
  
  has_many :followed_relations, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :followed_relations, source: :following
  has_many :following_relations, class_name: "Relation", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :following_relations, source: :followed

  def followings_and_user_ids
    followings.ids << id
  end

  def whiistles_including_users
    Whiistle.of_followings_and(self).includes(:user)
  end

  def suggested_users
    User.where('id NOT IN (?)', followings_and_user_ids).order('id desc').limit(3)
  end
end
