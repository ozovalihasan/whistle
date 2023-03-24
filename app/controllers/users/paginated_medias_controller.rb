# frozen_string_literal: true

class Users::PaginatedMediasController < Users::TabsController
  def index
    super

    all_whiistles = @user.whiistles.joins(:pictures_attachments).distinct.descending_order
    @paginate_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], user_paginated_medias_url(@user), current_user)
    @paginate_whiistles.set_basic
  end
end
