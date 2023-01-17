class Users::TabsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @relation = current_user.following_relations.find_by(followed_id: @user.id)
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end
