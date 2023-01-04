class Whiistle < BaseWhiistle
  has_one :flood, foreign_key: "base_whiistle_id"

  def leaf_flood
    descendants.where(type: BaseWhiistle.types["Flood"]).last
  end

  def count_floods
    descendants.where(type: BaseWhiistle.types["Flood"]).count
  end
end
