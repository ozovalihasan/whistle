# frozen_string_literal: true

class ResetAllUserCacheWhiistlesCounters < ActiveRecord::Migration[7.0]
  def up
    User.all.each do |user|
      User.reset_counters(user.id, :whiistles)
    end
  end

  def down; end
end
