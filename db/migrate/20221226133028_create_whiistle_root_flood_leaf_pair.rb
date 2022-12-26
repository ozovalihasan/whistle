class CreateWhiistleRootFloodLeafPair < ActiveRecord::Migration[7.0]
  def change
    create_table :whiistle_root_flood_leaf_pairs do |t|
      t.references :whiistle, null: false, foreign_key: { to_table: :base_whiistles }
      t.references :flood, null: false, foreign_key: { to_table: :base_whiistles }

      t.timestamps
    end
  end
end
