class AddUserRefToWhiistle < ActiveRecord::Migration[7.0]
  def change
    add_reference :whiistles, :user, null: false, foreign_key: true
  end
end
