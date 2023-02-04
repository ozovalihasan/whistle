# frozen_string_literal: true

class Users::DeleteFollowingComponent < ApplicationComponent
  def initialize(relation:)
    @relation = relation
  end

end
