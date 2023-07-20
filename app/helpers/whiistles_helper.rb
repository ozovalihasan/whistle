# frozen_string_literal: true

module WhiistlesHelper
  include Rails.application.routes.url_helpers
  
  def show_profile_picture(profile_picture)
    profile_picture.attachment || 'default_profile_picture.png'
  end

  def cover_image_url(user)
    rails_blob_path(user.cover_image, disposition: 'attachment', only_path: true) if user.cover_image.attached?
  end

end
