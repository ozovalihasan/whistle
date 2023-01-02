class ChangeAncestryTypeOfBaseWhiistles < ActiveRecord::Migration[7.0]
  def up
    change_column :base_whiistles, :ancestry, :text
  end
  
  def down
    change_column :base_whiistles, :ancestry, :string
  end
end
