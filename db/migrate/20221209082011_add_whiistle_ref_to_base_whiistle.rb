class AddWhiistleRefToBaseWhiistle < ActiveRecord::Migration[7.0]
  def change
    add_reference :base_whiistles, :whiistle, null: true, foreign_key: { to_table: :base_whiistles }
  end
end
