# frozen_string_literal: true

class Users::MediasController < Users::TabsController
  def index
    super

    all_whiistles = @user.whiistles.joins(:pictures_attachments).distinct.descending_order
    @paginate_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_medias_url(@user), current_user)
    @paginate_whiistles.set_basic

    return if request.format.turbo_stream?

    @tab_presenter = WhiistlesTabPresenter.new(@user, :medias, @paginate_whiistles)
  end
end
