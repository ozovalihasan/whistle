# frozen_string_literal: true

class AddWhiistlesCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :whiistles_count, :integer
  end
end
