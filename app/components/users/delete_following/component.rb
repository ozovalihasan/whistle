# frozen_string_literal: true

class Users::DeleteFollowing::Component < Application::Component
  def initialize(relation:)
    @relation = relation
  end

end
