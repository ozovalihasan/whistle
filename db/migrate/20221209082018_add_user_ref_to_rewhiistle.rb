class AddUserRefToRewhiistle < ActiveRecord::Migration[7.0]
  def change
    add_reference :rewhiistles, :user, null: false, foreign_key: true
  end
end
