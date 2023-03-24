# frozen_string_literal: true

class PaginatedWhiistlesController < ApplicationController
  before_action :authenticate_user!

  def index
    all_whiistles = current_user.main_page_whiistles
    @paginate_whiistles = PaginateWhiistles.new(all_whiistles, params[:page], paginated_whiistles_url, current_user)
    @paginate_whiistles.set_for_whiistles_index_page
  end
end
