class AddBaseWhiistlesFromBaseWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_reference :base_whiistles, :base_whiistle, null: true, foreign_key: true
  end
end
