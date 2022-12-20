module UsersHelper
  def tab_index(active_tab)
    ["whiistles", "medias", "liked_whiistles", "followings", "followers"].index(active_tab)
  end
end
