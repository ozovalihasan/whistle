# frozen_string_literal: true

class Users::ProfileImageButton::Component < Application::Component
  def initialize(user:, shape: nil, size: nil)
    @user = user
    @shape = shape
    @size = size
  end

end
