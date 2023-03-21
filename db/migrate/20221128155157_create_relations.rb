# frozen_string_literal: true

class CreateRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :relations, &:timestamps
  end
end
