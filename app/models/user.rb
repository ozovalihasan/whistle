# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :username, uniqueness: true, presence: true

  has_one_attached :profile_picture
  has_one_attached :cover_image
  has_many :whiistles, dependent: :destroy

  has_many :following_relations, dependent: :destroy, class_name: 'Following', foreign_key: 'user_id'
  has_many :followings, through: :following_relations, source: :follower
  has_many :followed_relations, dependent: :destroy, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :followed_relations, source: :following

  def will_save_change_to_email?
    false
  end
end
