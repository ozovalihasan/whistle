class TabPresenter
  attr_reader :user, :name, :paginated_records

  def initialize(user, name, paginated_records)
    @user = user
    @name = name
    @paginated_records = paginated_records
  end
end