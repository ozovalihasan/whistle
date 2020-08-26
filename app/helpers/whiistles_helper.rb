module WhiistlesHelper
  def show_profile_picture(user, classes = '')
    if user.profile_picture.attached?
      image_tag(user.profile_picture, size: '50x50', class: classes)
    else
      image_tag('default_profile_picture.png', size: '50x50', class: classes)
    end
  end

  def rounded_profile_picture(user)
    if user.profile_picture.attached?
      image_tag(user.profile_picture, size: '50x50', class: 'rounded-circle')
    else
      image_tag('default_profile_picture.png', size: '50x50', class: 'rounded-circle')
    end
  end

  include Rails.application.routes.url_helpers

  def cover_image_url(user)
    rails_blob_path(user.cover_image, disposition: 'attachment', only_path: true) if user.cover_image.attached?
  end

  def check_click(whiistle)
    'click' if whiistle.body.match(/c.*l.*i.*c.*k/i)
  end
end
