class CreateWhiistles < ActiveRecord::Migration[7.0]
  def change
    create_table :whiistles do |t|

      t.timestamps
    end
  end
end
