module WhiistlesHelper
  def show_profile_picture(profile_picture)
    profile_picture.attachment || 'default_profile_picture.png'
  end

  include Rails.application.routes.url_helpers

  def cover_image_url(user)
    rails_blob_path(user.cover_image, disposition: 'attachment', only_path: true) if user.cover_image.attached?
  end

  def check_click(whiistle)
    'click' if whiistle.body.match(/c.*l.*i.*c.*k/i)
  end

  def check_follow(user)
    render 'users/follow_button', user: user unless current_user.followings_and_user_ids.include? user.id
  end

  def render_profile_image_small(user)
    render "whiistles/profile_image", user: user, size: :small
  end

  def render_profile_image_standard(user)
    render "whiistles/profile_image", user: user, size: :standard
  end

  def render_whiistle_with_flood_info(whiistle)
    render "whiistles/whiistle", whiistle: whiistle, show_flood_info: true
  end
end
