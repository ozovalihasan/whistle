# frozen_string_literal: true

class Users::MediasController < Users::PaginatedMediasController
  def index
    super

    @tab_presenter = WhiistlesTabPresenter.new(@user, :medias, @paginate_whiistles)
  end
end
