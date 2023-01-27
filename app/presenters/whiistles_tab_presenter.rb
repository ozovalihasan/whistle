class WhiistlesTabPresenter
  attr_reader :new_whiistle, :paginated_whiistles, :user
  
  def initialize(paginated_whiistles, user = nil, new_whiistle = nil)
    @paginated_whiistles = paginated_whiistles
    @new_whiistle = new_whiistle
    @user = user
  end

  def show_form?
    new_whiistle.present?
  end
end