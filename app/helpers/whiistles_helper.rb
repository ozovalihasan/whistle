# frozen_string_literal: true

module WhiistlesHelper
  def show_profile_picture(user)
    user.profile_picture.attached? ? image_tag(user.profile_picture, size: '50x50') : image_tag('default_profile_picture.png', size: '50x50')
  end
end
