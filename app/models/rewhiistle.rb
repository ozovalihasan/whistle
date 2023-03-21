# frozen_string_literal: true

class Rewhiistle < ApplicationRecord
  validates :user, uniqueness: { scope: :whiistle }

  belongs_to :whiistle, class_name: 'BaseWhiistle', counter_cache: true
  belongs_to :user, counter_cache: true
end
