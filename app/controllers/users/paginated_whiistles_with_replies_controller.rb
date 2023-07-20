# frozen_string_literal: true

class Users::PaginatedWhiistlesWithRepliesController < Users::TabsController
  def index
    super

    all_whiistles = @user.whiistles_of_whiistles_and_replies_index_page
    @paginate_whiistles = PaginateWhiistles.new(all_whiistles,
                                                params[:page],
                                                user_paginated_whiistles_with_replies_url(@user),
                                                current_user)

    @paginate_whiistles.set_connected
  end
end
