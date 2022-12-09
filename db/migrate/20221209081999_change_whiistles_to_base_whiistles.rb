class ChangeWhiistlesToBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    rename_table :whiistles, :base_whiistles
  end
end
