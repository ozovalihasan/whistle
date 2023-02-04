# frozen_string_literal: true

class Users::AddFollowingComponent < ApplicationComponent
  def initialize(user:)
    @user = user
  end
end
