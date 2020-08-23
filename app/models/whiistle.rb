# frozen_string_literal: true

class Whiistle < ApplicationRecord
  validates :body, length: { minimum: 3 }

  belongs_to :user
end
