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
    sql1 = <<~QUERY
      SELECT base_whiistles.*, base_whiistles.created_at AS whiistle_created_at, rewhiistles.created_at AS primary_created_at 
      FROM rewhiistles INNER JOIN base_whiistles ON base_whiistles.id = rewhiistles.whiistle_id 
      WHERE rewhiistles.user_id = :user_id
    QUERY

    sql2 = <<~QUERY
      SELECT base_whiistles.*, base_whiistles.created_at AS whiistle_created_at, base_whiistles.created_at AS primary_created_at  
      FROM base_whiistles 
      WHERE base_whiistles.user_id = :user_id
    QUERY

    sql3 = "#{sql1} UNION ALL #{sql2}"
    sql4 = "#{sql3} ORDER BY primary_created_at DESC"
    
    BaseWhiistle.find_by_sql([sql3, user_id: self.id])
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
