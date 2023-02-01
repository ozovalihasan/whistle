class WhiistlesTabPresenter < TabPresenter
  attr_reader :show_form, :new_whiistle
  
  def initialize(user, name, show_form, new_whiistle = nil)
    super(user, name)

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