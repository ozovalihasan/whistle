# frozen_string_literal: true

class Users::UserComponent < ApplicationComponent
  with_collection_parameter :user
  
  def initialize(user:, cur_user:)
    @user = user
    @cur_user = cur_user
  end
end
