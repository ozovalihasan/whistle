# frozen_string_literal: true

class Users::FollowButtonComponent < ApplicationComponent
  def initialize(user:)
    @user = user
  end

end
