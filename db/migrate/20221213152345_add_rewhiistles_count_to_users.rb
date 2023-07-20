# frozen_string_literal: true

class AddRewhiistlesCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rewhiistles_count, :integer
  end
end
