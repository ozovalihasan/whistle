class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :username, uniqueness: true, presence: true
  validates :fullname, presence: true

  has_one_attached :profile_picture
  has_one_attached :cover_image
  has_many :whiistles, -> { descending_order }, dependent: :destroy

  has_many :following_relations, dependent: :destroy, class_name: 'Following', foreign_key: 'user_id'
  has_many :followings, through: :following_relations, source: :follower
  has_many :followed_relations, -> { descending_order },
           dependent: :destroy, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :followed_relations, source: :following

  def followings_and_user_ids
    followings.ids << id
  end

  def whiistles_including_users
    Whiistle.of_followings_and(self).includes(:user)
  end

  def suggested_users
    User.where('id NOT IN (?)', followings_and_user_ids).order('id desc').limit(3)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.github'] && session['devise.github_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
      if data = session['devise.google_oauth2'] && session['devise.google_oauth2_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
