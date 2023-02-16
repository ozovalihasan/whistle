# frozen_string_literal: true

class Users::SidebarRightComponent < ApplicationComponent
  include ApplicationHelper
  include WhiistlesHelper
  
  def initialize(sidebar_right_presenter:)
    @user = sidebar_right_presenter.user 
    @relation = sidebar_right_presenter.relation 
    @random_followings = sidebar_right_presenter.random_followings 
    @cur_user = sidebar_right_presenter.cur_user
  end
end
