# frozen_string_literal: true

class Like < ApplicationRecord
  validates :user, uniqueness: { scope: :whiistle }

  belongs_to :whiistle, class_name: 'BaseWhiistle', counter_cache: true
  belongs_to :user
end
