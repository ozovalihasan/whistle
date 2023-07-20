# frozen_string_literal: true

class AddFollowingRefToRelation < ActiveRecord::Migration[7.0]
  def change
    add_reference :relations, :following, null: false, foreign_key: { to_table: :users }
  end
end
