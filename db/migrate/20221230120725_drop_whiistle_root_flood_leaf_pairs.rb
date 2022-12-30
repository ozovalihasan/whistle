class DropWhiistleRootFloodLeafPairs < ActiveRecord::Migration[7.0]
  def change
    drop_table :whiistle_root_flood_leaf_pairs do |t|
      t.references null: false
      t.references null: false

      t.timestamps null: false
    end
  end
end
