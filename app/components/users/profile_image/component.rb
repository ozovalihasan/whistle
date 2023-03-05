# frozen_string_literal: true

class Users::ProfileImage::Component < Application::Component
  def initialize(user:, size: nil, shape: nil)
    size = filter_attribute(size&.to_sym, VARIANT_SIZES.keys, default: :default)
    @size = VARIANT_SIZES[size]

    shape = filter_attribute(shape&.to_sym, VARIANT_SHAPES.keys, default: :default)
    @shape = VARIANT_SHAPES[shape]
    
    @href = user.profile_picture.attachment || 'default_profile_picture.png'
  end

  private
  
  VARIANT_SIZES = {
    default: "50x50",
    small: "25x25"
  }.freeze

  VARIANT_SHAPES = {
    default: "",
    rounded: "rounded-full"
  }.freeze

end
