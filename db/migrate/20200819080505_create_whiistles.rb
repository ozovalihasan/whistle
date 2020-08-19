# frozen_string_literal: true

class CreateWhiistles < ActiveRecord::Migration[6.0]
  def change
    create_table :whiistles do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
