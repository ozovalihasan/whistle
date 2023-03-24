# frozen_string_literal: true

class Users::WhiistlesWithRepliesController < Users::PaginatedWhiistlesWithRepliesController
  def index
    super

    whiistle = Whiistle.new

    @tab_presenter = WhiistlesTabPresenter.new(@user, :whiistles_with_replies, @paginate_whiistles, whiistle)
  end
end
