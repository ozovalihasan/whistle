class WhiistlesTabPresenter < TabPresenter
  attr_reader :new_whiistle
  
  def initialize(user, name, paginated_records, new_whiistle = nil)
    super(user, name, paginated_records)

    @new_whiistle = new_whiistle
  end

  def show_form?
    new_whiistle.present?
  end

  def no_whiistle_info
    user.fullname + " doesn't have any whiistle to show."
  end

end