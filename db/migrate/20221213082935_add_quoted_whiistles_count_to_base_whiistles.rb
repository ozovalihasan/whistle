# frozen_string_literal: true

class AddQuotedWhiistlesCountToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_column :base_whiistles, :quoted_whiistles_count, :integer
  end
end
