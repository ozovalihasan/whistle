class Flood < BaseWhiistle
  belongs_to :whiistle, foreign_key: "base_whiistle_id", class_name: "BaseWhiistle", counter_cache: :replies_count
  has_one :flood, foreign_key: "base_whiistle_id"
  has_one :whiistle_root_flood_leaf_pair, dependent: :destroy
  has_one :root_whiistle, through: :whiistle_root_flood_leaf_pair, source: :whiistle
end
