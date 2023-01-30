class TabPresenter
  attr_reader :user, :name

  def initialize(user, name)
    @user = user
    @name = name
  end
end