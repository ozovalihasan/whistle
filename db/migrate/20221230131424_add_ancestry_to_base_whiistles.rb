# frozen_string_literal: true

class AddAncestryToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_column :base_whiistles, :ancestry, :string
    add_index :base_whiistles, :ancestry
  end
end
