class RemoveWhiistlesFromBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    remove_reference :base_whiistles, :whiistle, null: true, foreign_key: { to_table: :base_whiistles }
  end
end
