class WhiistlesTabPresenter
  attr_reader :new_whiistle, :paginated_whiistles, :user, :name, :show_form
  
  def initialize(user, paginated_whiistles, name, show_form, new_whiistle = nil)
    @user = user
    @paginated_whiistles = paginated_whiistles
    @name = name
    @show_form = show_form
    @new_whiistle = new_whiistle
  end

  def show_form?
    show_form
  end

  def no_whiistle_info
    user.fullname + " doesn't have any whiistle to show."
  end

  def whiistle_exist?
    paginated_whiistles.records.present?
  end
end