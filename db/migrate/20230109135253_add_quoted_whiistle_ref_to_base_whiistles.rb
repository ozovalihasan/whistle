# frozen_string_literal: true

class AddQuotedWhiistleRefToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_reference :base_whiistles, :quoted_whiistle, null: true, foreign_key: { to_table: :base_whiistles }
  end
end
