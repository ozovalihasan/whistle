class CurrentUserPresenter
  attr_reader :current_user
  
  def initialize(current_user)
    @current_user = current_user
    @likes = current_user.likes.to_h {|like| [like.whiistle_id, like]}
    @rewhiistles = current_user.rewhiistles.to_h {|rewhiistle| [rewhiistle.whiistle_id, rewhiistle]}
  end

  def like_of whiistle
    @likes[whiistle.id]
  end

  def liked? whiistle
    not @likes[whiistle.id].nil?
  end
  
  def rewhiistle_of whiistle
    @rewhiistles[whiistle.id]
  end

  def rewhiistled? whiistle
    not @rewhiistles[whiistle.id].nil?
  end
end