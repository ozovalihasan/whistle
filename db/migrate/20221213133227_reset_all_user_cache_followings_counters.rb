class ResetAllUserCacheFollowingsCounters < ActiveRecord::Migration[7.0]
  def up
    User.all.each do |user|
      User.reset_counters(user.id, :followings)
    end
  end
    
  def down
  end
end
