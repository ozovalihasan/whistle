# frozen_string_literal: true

class AddWhiistleRefToRewhiistle < ActiveRecord::Migration[7.0]
  def change
    add_reference :rewhiistles, :whiistle, null: false, foreign_key: { to_table: :base_whiistles }
  end
end
