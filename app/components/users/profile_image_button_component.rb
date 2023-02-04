# frozen_string_literal: true

class Users::ProfileImageButtonComponent < ApplicationComponent
  def initialize(user:, shape: nil, size: nil)
    @user = user
    @shape = shape
    @size = size
  end

end
