# frozen_string_literal: true

class TabPresenter
  attr_reader :user, :name, :paginate_records

  def initialize(user, name, paginate_records)
    @user = user
    @name = name
    @paginate_records = paginate_records
  end
end
