# frozen_string_literal: true

class Users::PaginatedWhiistlesController < Users::TabsController
  def index
    super

    all_whiistles = @user.whiistles_of_whiistles_index_page
    @paginate_whiistles = PaginateWhiistles.new(all_whiistles,
                                                params[:page],
                                                user_paginated_whiistles_url(@user),
                                                current_user)
    @paginate_whiistles.set_connected
  end
end
