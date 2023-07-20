# frozen_string_literal: true

class WhiistlesTabPresenter < TabPresenter
  attr_reader :new_whiistle, :current_user_presenter

  def initialize(user, name, paginate_records, new_whiistle = nil)
    super(user, name, paginate_records)

    @new_whiistle = new_whiistle
    @current_user_presenter = paginate_records.current_user_presenter
  end

  def show_form?
    new_whiistle.present?
  end

  def no_whiistle_info
    "#{user.fullname} doesn't have any whiistle to show."
  end
end
