class Users::LikedWhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @followings = @user.followings
    @followers = @user.followers.with_attached_profile_picture
    @all_whiistles = @user.liked_whiistles.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles, @last_page, @page = PaginateWhiistles.call(@all_whiistles, params[:page])
    @relation = current_user.following_relations.find_by(followed_id: @user.id)
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end