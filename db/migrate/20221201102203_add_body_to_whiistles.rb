class AddBodyToWhiistles < ActiveRecord::Migration[7.0]
  def change
    add_column :whiistles, :body, :text
  end
end
