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
  has_many :liked_whiistles, through: :likes, source: :whiistle
  has_many :replies, dependent: :destroy
  has_many :rewhiistles, dependent: :destroy
  has_many :shared_whiistles, through: :rewhiistles, source: :whiistle
  has_many :whiistles, class_name: "BaseWhiistle", dependent: :destroy
  
  has_many :followed_relations, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :followed_relations, source: :following
  has_many :following_relations, class_name: "Relation", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :following_relations, source: :followed

  def main_page_whiistles
    whiistles_shared_by_user = self.shared_whiistles.select("base_whiistles.*, rewhiistles.created_at AS primary_created_at, 'shared_whiistle' as label").to_sql
    user_whiistles = self.whiistles.select("base_whiistles.*, base_whiistles.created_at as primary_created_at, 'primary_whiistle' AS label").to_sql
    all_whiistles = "(#{whiistles_shared_by_user}) UNION ALL (#{user_whiistles})"
    all_whiistles_without_replies = "SELECT * FROM (#{all_whiistles}) AS all_whiistles WHERE all_whiistles.type != 1"
    ordered_whiistles = "#{all_whiistles_without_replies} ORDER BY primary_created_at DESC"
    
    BaseWhiistle.find_by_sql(ordered_whiistles)
  end
  
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
