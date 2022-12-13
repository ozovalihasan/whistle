class ResetAllUserCacheRewhiistlesCounters < ActiveRecord::Migration[7.0]
  def up
    User.all.each do |user|
      User.reset_counters(user.id, :rewhiistles)
    end
  end
    
  def down
  end
end
