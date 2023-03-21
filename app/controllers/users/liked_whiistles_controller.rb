# frozen_string_literal: true

module Users
  class LikedWhiistlesController < Users::TabsController
    def index
      super

      all_whiistles = @user.liked_whiistles.includes(user: [{ profile_picture_attachment: :blob }])
      @paginate_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_liked_whiistles_url(@user),
                                                  current_user)
      @paginate_whiistles.set_basic

      return if request.format.turbo_stream?

      @tab_presenter = WhiistlesTabPresenter.new(@user, :liked_whiistles, @paginate_whiistles)
    end
  end
end
