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
end
