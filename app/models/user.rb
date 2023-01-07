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
  has_many :liked_whiistles, -> { order("likes.created_at DESC") }, through: :likes, source: :whiistle
  has_many :replies, dependent: :destroy
  has_many :rewhiistles, dependent: :destroy
  has_many :shared_whiistles, through: :rewhiistles, source: :whiistle
  has_many :whiistles, class_name: "BaseWhiistle", dependent: :destroy
  
  has_many :followed_relations, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :followed_relations, source: :following
  has_many :following_relations, class_name: "Relation", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :following_relations, source: :followed

  def whiistles_of_whiistles_index_page(remove_replies = true)
    whiistles_shared_by_user = self.shared_whiistles
                                   .select("
                                     base_whiistles.*, 
                                     rewhiistles.created_at AS primary_created_at, 
                                     'shared_whiistle' AS label
                                   ")
    
    user_whiistles = self.whiistles
                         .select("
                           base_whiistles.*, 
                           base_whiistles.created_at AS primary_created_at, 
                           'primary_whiistle' AS label
                         ").without_floods

    if remove_replies
      whiistles_shared_by_user = whiistles_shared_by_user.without_replies
      user_whiistles = user_whiistles.without_replies
    end                   

    all_whiistles = BaseWhiistle.select("*").from(
                                               "(
                                                 (#{whiistles_shared_by_user.to_sql}) UNION ALL 
                                                 (#{user_whiistles.to_sql})
                                               ) AS all_whiistles"
                                             )
    all_whiistles.order(primary_created_at: :desc)
  end

  def main_page_whiistles
    followings_ids = self.followings.select("relations.followed_id")

    whiistles_shared_by_followings = BaseWhiistle.joins(rewhiistles: :user)
                                                 .select("
                                                   base_whiistles.*, 
                                                   rewhiistles.created_at AS primary_created_at, 
                                                   'shared_whiistle' AS label,
                                                   users.username AS parent_user
                                                 ")
                                                 .where(
                                                   "rewhiistles.user_id IN (?)", 
                                                   followings_ids
                                                 )
                                                 .without_replies
                                                 .without_floods
                                           
    whiistles_liked_by_followings = BaseWhiistle.joins(likes: :user)
                                                .select("
                                                  base_whiistles.*, 
                                                  likes.created_at AS primary_created_at, 
                                                  'liked_whiistle' AS label,
                                                  users.username AS parent_user
                                                ")
                                                .where(
                                                  "likes.user_id IN (?)", 
                                                  followings_ids
                                                )
                                                .without_replies
                                                .without_floods
                                           
    whiistles_of_followings = BaseWhiistle.select("
                                             base_whiistles.*, 
                                             base_whiistles.created_at AS primary_created_at, 
                                             'primary_whiistle' AS label,
                                             '' AS parent_user
                                           ")
                                           .where(
                                             "base_whiistles.user_id IN (?)", 
                                             followings_ids
                                           )
                                           .without_floods

    all_whiistles = BaseWhiistle.select("*").from(
                                               "(
                                                 ( #{ whiistles_shared_by_followings.to_sql } ) UNION ALL 
                                                 ( #{ whiistles_liked_by_followings.to_sql } ) UNION ALL 
                                                 ( #{ whiistles_of_followings.to_sql } )
                                               ) AS all_whiistles"
                                             )

    all_whiistles.order(primary_created_at: :desc).includes(:user)
  end

  def whiistles_of_whiistles_and_replies_index_page
    whiistles_of_whiistles_index_page(false)
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
