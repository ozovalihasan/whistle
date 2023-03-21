# frozen_string_literal: true

class ChangeUsersCountersDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :whiistles_count, from: nil, to: 0)
    change_column_default(:users, :followers_count, from: nil, to: 0)
    change_column_default(:users, :followings_count, from: nil, to: 0)
    change_column_default(:users, :rewhiistles_count, from: nil, to: 0)
  end
end
