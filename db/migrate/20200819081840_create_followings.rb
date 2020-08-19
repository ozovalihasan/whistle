# frozen_string_literal: true

class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :followed, null: false, foreign_key: false

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :followed_id
  end
end
