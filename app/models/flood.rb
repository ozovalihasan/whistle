class Flood < BaseWhiistle
  has_one :flood, foreign_key: "base_whiistle_id"
  belongs_to :whiistle, foreign_key: "base_whiistle_id", class_name: "BaseWhiistle", counter_cache: :replies_count
end
