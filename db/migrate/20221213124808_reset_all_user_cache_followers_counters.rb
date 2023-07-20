# frozen_string_literal: true

class ResetAllUserCacheFollowersCounters < ActiveRecord::Migration[7.0]
  def up
    User.all.each do |user|
      User.reset_counters(user.id, :followers)
    end
  end

  def down; end
end
