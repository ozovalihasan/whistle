class Whiistle < BaseWhiistle
  has_one :flood, foreign_key: "base_whiistle_id"
  has_one :whiistle_root_flood_leaf_pair, dependent: :destroy
  has_one :last_flood, through: :whiistle_root_flood_leaf_pair, source: :flood
end
