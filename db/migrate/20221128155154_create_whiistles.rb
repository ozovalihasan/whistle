# frozen_string_literal: true

class CreateWhiistles < ActiveRecord::Migration[7.0]
  def change
    create_table :whiistles, &:timestamps
  end
end
