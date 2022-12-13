class AddRepliesCountToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_column :base_whiistles, :replies_count, :integer
  end
end
