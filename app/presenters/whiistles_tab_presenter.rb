class WhiistlesTabPresenter
  attr_reader :new_whiistle, :user, :name, :show_form
  
  def initialize(user, name, show_form, new_whiistle = nil)
    @user = user
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

end