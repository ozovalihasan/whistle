class Whiistle < BaseWhiistle
  has_one :flood, foreign_key: "base_whiistle_id"
end
