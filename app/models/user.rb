# frozen_string_literal: true

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

  has_many :likes, dependent: :destroy
  has_many :liked_whiistles, -> { order('likes.created_at DESC') }, through: :likes, source: :whiistle
  has_many :replies, dependent: :destroy
  has_many :rewhiistles, dependent: :destroy
  has_many :shared_whiistles, through: :rewhiistles, source: :whiistle
  has_many :whiistles, class_name: 'BaseWhiistle', dependent: :destroy

  has_many :followed_relations, class_name: 'Relation', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :followed_relations, source: :following
  has_many :following_relations, class_name: 'Relation', foreign_key: 'following_id', dependent: :destroy
  has_many :followings, through: :following_relations, source: :followed

  scope :with_current_user_situation, lambda { |cur_user|
    select(
      <<~SQL.squish
        users.*,
        (
          CASE WHEN (
            ( cur_user_following_relations.id IS NULL )
            AND ( users.id != #{cur_user.id} )
          ) THEN false ELSE true END
        ) AS is_followed_by_cur_user
      SQL
    )
      .joins(
        <<~SQL.squish
          LEFT JOIN (
            #{cur_user.following_relations.to_sql}
          ) AS cur_user_following_relations ON users.id = cur_user_following_relations.followed_id
        SQL
      )
  }
  scope :in_random_order, -> { order('RANDOM()') }

  def whiistles_of_whiistles_index_page(remove_replies = true)
    whiistles_shared_by_user = shared_whiistles
                               .select(
                                 <<~SQL.squish
                                   base_whiistles.*,
                                   rewhiistles.created_at AS primary_created_at,
                                   'shared_whiistle' AS label,
                                   '#{fullname}' AS parent_user
                                 SQL
                               )

    user_whiistles = whiistles
                     .select(
                       <<~SQL.squish
                         base_whiistles.*,
                         base_whiistles.created_at AS primary_created_at,
                         'primary_whiistle' AS label,
                         '' AS parent_user
                       SQL
                     )
                     .without_floods

    user_whiistles = user_whiistles.without_replies if remove_replies

    all_whiistles = BaseWhiistle
                    .select('*')
                    .from(
                      <<~SQL.squish
                        (
                          (#{whiistles_shared_by_user.to_sql}) UNION ALL
                          (#{user_whiistles.to_sql})
                        ) AS all_whiistles
                      SQL
                    )

    all_whiistles.order(primary_created_at: :desc)
  end

  def whiistles_of_whiistles_and_replies_index_page
    whiistles_of_whiistles_index_page(false)
  end

  def main_page_whiistles
    followings_ids = followings.select('relations.followed_id')

    whiistles_shared_by_followings = BaseWhiistle
                                     .joins(rewhiistles: :user)
                                     .select(
                                       <<~SQL.squish
                                         base_whiistles.*,
                                         rewhiistles.created_at AS primary_created_at,
                                         'shared_whiistle' AS label,
                                         users.fullname AS parent_user
                                       SQL
                                     )
                                     .where(rewhiistles: { user_id: followings_ids })
                                     .without_replies
                                     .without_floods

    whiistles_liked_by_followings = BaseWhiistle
                                    .joins(likes: :user)
                                    .select(
                                      <<~SQL.squish
                                        base_whiistles.*,
                                        likes.created_at AS primary_created_at,
                                        'liked_whiistle' AS label,
                                        users.fullname AS parent_user
                                      SQL
                                    )
                                    .where(likes: { user_id: followings_ids })
                                    .without_replies
                                    .without_floods

    whiistles_of_followings = BaseWhiistle
                              .select(
                                <<~SQL.squish
                                  base_whiistles.*,
                                  base_whiistles.created_at AS primary_created_at,
                                  'primary_whiistle' AS label,
                                  '' AS parent_user
                                SQL
                              )
                              .where(base_whiistles: { user_id: followings_ids })
                              .without_floods
                              .without_replies

    replies_of_followings = Reply
                            .joins(:whiistle)
                            .select(
                              <<~SQL.squish
                                base_whiistles.*,
                                base_whiistles.created_at AS primary_created_at,
                                'primary_whiistle' AS label,
                                '' AS parent_user
                              SQL
                            )
                            .where(base_whiistles: { user_id: followings_ids })
                            .where(
                              whiistles_base_whiistles: {
                                type: [
                                  BaseWhiistle.types['Whiistle']
                                ]
                              }
                            )

    all_whiistles = BaseWhiistle
                    .select('*')
                    .from(
                      <<~SQL.squish
                        (
                          ( #{whiistles_shared_by_followings.to_sql} ) UNION ALL
                          ( #{whiistles_liked_by_followings.to_sql} ) UNION ALL
                          ( #{whiistles_of_followings.to_sql} ) UNION ALL
                          ( #{replies_of_followings.to_sql} )
                        ) AS all_whiistles
                      SQL
                    )

    all_whiistles.order(primary_created_at: :desc).includes(:user)
  end

  def followings_and_user_ids
    followings.ids << id
  end

  def suggested_users
    User.where.not(id: followings_and_user_ids).order('id desc').limit(3)
  end
end
