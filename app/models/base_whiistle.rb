class BaseWhiistle < ApplicationRecord
  attr_accessor :quoted_whiistle_url
  
  before_validation :set_parent_id
  before_validation :set_quoted_whiistle_id
  
  validates :body, length: { minimum: 3, message: 'of your whiistle cannot be shorter than 3 letters' }
  
  has_many_attached :pictures do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  
  has_ancestry
  
  has_many :quoting_whiistles, class_name: "BaseWhiistle", foreign_key: "quoted_whiistle_id", dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :rewhiistles, foreign_key: "whiistle_id", dependent: :destroy
  has_many :likes, foreign_key: "whiistle_id", dependent: :destroy
  belongs_to :user, counter_cache: :whiistles_count
  belongs_to :quoted_whiistle, class_name: "BaseWhiistle", optional: true, counter_cache: :quoted_whiistles_count

  scope :descending_order, -> { order(created_at: :desc) }
  scope :without_replies, -> { where.not(type: types["Reply"]) }
  scope :without_floods, -> { where.not(type: types["Flood"]) }

  enum type: {
    'Whiistle' => 0,
    'Reply' => 1,
    'Flood' => 3,
  }

  private 

  def set_quoted_whiistle_id
    if quoted_whiistle_url
      path = URI.extract(quoted_whiistle_url).first
      all_parts = Rails.application.routes.recognize_path(path)
      if all_parts[:controller] == "whiistles" && all_parts[:action] == "show"
        self.quoted_whiistle_id = all_parts[:id]
      else
        nil
      end
    end
  end
  
  def set_parent_id
    if base_whiistle_id && ( [Reply, Flood].include? self.class )
      self.parent_id = base_whiistle_id 
    else
      self.parent_id = nil
    end
  end
end
