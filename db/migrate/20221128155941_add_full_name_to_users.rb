# frozen_string_literal: true

class AddFullNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fullname, :string, null: false
  end
end
