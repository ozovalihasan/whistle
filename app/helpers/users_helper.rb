module UsersHelper
  def tab_index(active_tab)
    ["whiistles", "followings", "followers"].index(active_tab)
  end
end
