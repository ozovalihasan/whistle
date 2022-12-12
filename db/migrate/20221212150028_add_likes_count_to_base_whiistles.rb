class AddLikesCountToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_column :base_whiistles, :likes_count, :integer
  end
end
