class Users::WhiistlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @whiistle = Whiistle.new
    @followings = @user.followings
    @followers = @user.followers.with_attached_profile_picture
    @all_whiistles = @user.whiistles_of_whiistles_index_page.includes(user:  [{ profile_picture_attachment: :blob }])
    @paginated_whiistles, @last_page, @page = PaginateWhiistles.call(@all_whiistles, params[:page])
    @relation = current_user.following_relations.find_by(followed_id: @user.id)
  end

  private 

  def set_user
    @user = User.find(params[:user_id])
  end
end
