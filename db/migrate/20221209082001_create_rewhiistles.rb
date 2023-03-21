# frozen_string_literal: true

class CreateRewhiistles < ActiveRecord::Migration[7.0]
  def change
    create_table :rewhiistles, &:timestamps
  end
end
