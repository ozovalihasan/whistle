# frozen_string_literal: true

class Users::PaginatedLikedWhiistlesController < Users::TabsController
  def index
    super

    all_whiistles = @user.liked_whiistles
    @paginate_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_paginated_liked_whiistles_url(@user),
                                                current_user)
    @paginate_whiistles.set_basic
  end
end
