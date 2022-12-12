class AddRewhiistlesCountToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_column :base_whiistles, :rewhiistles_count, :integer
  end
end
