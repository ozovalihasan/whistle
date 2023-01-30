class ChangeQuotedWhiistlesColumnOfBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    rename_column :base_whiistles, :quoted_whiistles_count, :quoting_whiistles_count
  end
end
