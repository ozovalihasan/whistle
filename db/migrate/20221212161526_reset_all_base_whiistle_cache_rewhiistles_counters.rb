# frozen_string_literal: true

class ResetAllBaseWhiistleCacheRewhiistlesCounters < ActiveRecord::Migration[7.0]
  def up
    BaseWhiistle.all.each do |whiistle|
      BaseWhiistle.reset_counters(whiistle.id, :rewhiistles)
    end
  end

  def down; end
end
