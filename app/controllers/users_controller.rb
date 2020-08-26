class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to root_path if params[:id] == current_user.id.to_s
    @user = User.find(params[:id])
    @whiistle = Whiistle.new
    @whiistles = @user.whiistles.order(created_at: :desc)
    @followers = @user.followers
  end
end
