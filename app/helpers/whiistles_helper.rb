# frozen_string_literal: true

module WhiistlesHelper
  def show_profile_picture(user, classes = '')
    user.profile_picture.attached? ? image_tag(user.profile_picture, size: '50x50', class: classes) : image_tag('default_profile_picture.png', size: '50x50', class: classes)
  end

  def rounded_profile_picture(user)
    user.profile_picture.attached? ? image_tag(user.profile_picture, size: '50x50', class: 'rounded-circle') : image_tag('default_profile_picture.png', size: '50x50', class: 'rounded-circle')
  end

  include Rails.application.routes.url_helpers

  def cover_image_url(user)
    if user.cover_image.attached?
      rails_blob_path(user.cover_image, disposition: 'attachment', only_path: true)
    end
  end

  def check_click(whiistle)
    'click' if whiistle.body.match(/c.*l.*i.*c.*k/i)
  end
end
