# frozen_string_literal: true

class Users::SidebarRightComponent < ApplicationComponent
  include ApplicationHelper
  include WhiistlesHelper
  
  def initialize(presenter:)
    @user = presenter.user 
    @relation = presenter.relation 
    @random_followings = presenter.random_followings 
    @cur_user = presenter.cur_user
  end
end
