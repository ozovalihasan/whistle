class Flood < BaseWhiistle
  belongs_to :whiistle, foreign_key: "base_whiistle_id", counter_cache: :replies_count
end
