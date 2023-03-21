# frozen_string_literal: true

class ChangeBaseWhiistlesCountersDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:base_whiistles, :likes_count, from: nil, to: 0)
    change_column_default(:base_whiistles, :rewhiistles_count, from: nil, to: 0)
    change_column_default(:base_whiistles, :replies_count, from: nil, to: 0)
    change_column_default(:base_whiistles, :quoted_whiistles_count, from: nil, to: 0)
  end
end
