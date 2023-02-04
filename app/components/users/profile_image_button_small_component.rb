# frozen_string_literal: true

class Users::ProfileImageButtonSmallComponent < ApplicationComponent
  def initialize(user:)
    @user = user
  end
end
