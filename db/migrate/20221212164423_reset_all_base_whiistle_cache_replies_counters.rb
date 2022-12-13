class ResetAllBaseWhiistleCacheRepliesCounters < ActiveRecord::Migration[7.0]
  def up
    BaseWhiistle.all.each do |whiistle|
      BaseWhiistle.reset_counters(whiistle.id, :replies)
    end
  end
    
  def down
  end
end
