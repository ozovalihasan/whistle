module ApplicationHelper
  def check_notice
    render 'layouts/notice' if notice
  end

  def check_alert
    render 'layouts/alert' if alert
  end

  def show_leftside
    render 'layouts/left_side' if current_user
  end

  def check_icons
    render 'layouts/icons' if current_user
  end

  def whiistle_reply_form_target(whiistle)
    dom_id(whiistle, :reply)
  end

  def whiistle_reply_counter_target(whiistle)
    dom_id(whiistle, :reply_counter)
  end
  
  def whiistle_quoted_whiistle_form_target(whiistle)
    dom_id(whiistle, :quoted_whiistle)
  end

  def whiistle_rewhiistle_button_target(whiistle)
    dom_id(whiistle, :rewhiistle_button)
  end

  def whiistle_like_button_target(whiistle)
    dom_id(whiistle, :like_button)
  end

end
