# frozen_string_literal: true

class Users::AddDeleteFollowing::Component < Application::Component
  def initialize(user:, cur_user:, relation:)
    @user = user
    @cur_user = cur_user
    @relation = relation
  end

end
