# frozen_string_literal: true

class Users::AddFollowingComponent < ApplicationComponent
  def initialize(user_id:)
    @user_id = user_id
  end
end
