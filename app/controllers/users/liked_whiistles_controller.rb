# frozen_string_literal: true

class Users::LikedWhiistlesController < Users::PaginatedLikedWhiistlesController
  def index
    super

    @tab_presenter = WhiistlesTabPresenter.new(@user, :liked_whiistles, @paginate_whiistles)
  end
end
