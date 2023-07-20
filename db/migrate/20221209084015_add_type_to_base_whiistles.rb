# frozen_string_literal: true

class AddTypeToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_column :base_whiistles, :type, :integer
  end
end
