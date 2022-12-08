module UsersHelper
  def tab_index(active_tab)
    ["whiistles", "medias", "followings", "followers"].index(active_tab)
  end
end
