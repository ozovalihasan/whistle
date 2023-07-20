# frozen_string_literal: true

class CurrentUserPresenter
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
    @likes = current_user.likes.index_by(&:whiistle_id)
    @rewhiistles = current_user.rewhiistles.index_by(&:whiistle_id)
  end

  def like_of(whiistle)
    @likes[whiistle.id]
  end

  def liked?(whiistle)
    !@likes[whiistle.id].nil?
  end

  def rewhiistle_of(whiistle)
    @rewhiistles[whiistle.id]
  end

  def rewhiistled?(whiistle)
    !@rewhiistles[whiistle.id].nil?
  end
end
