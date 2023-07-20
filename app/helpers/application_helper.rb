# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def check_icons
    render 'layouts/icons' if current_user
  end

  def user_followers_count_target(user)
    dom_id(user, :followers_count)
  end

  def user_left_side_followings_count_target(user)
    dom_id(user, :left_side_followings_count)
  end

  def user_create_delete_relation_target(user)
    dom_id(user, :create_delete_relation)
  end

  def whiistle_reply_form_target(whiistle)
    dom_id(whiistle, :reply)
  end

  def whiistle_reply_counter_target(whiistle)
    dom_id(whiistle, :reply_counter)
  end

  def whiistle_quoting_whiistle_form_target(whiistle)
    dom_id(whiistle, :quoting_whiistle)
  end

  def whiistle_rewhiistle_button_target(whiistle)
    dom_id(whiistle, :rewhiistle_button)
  end

  def whiistle_rewhiistle_or_quote_button_target(whiistle)
    dom_id(whiistle, :rewhiistle_or_quote_button)
  end

  def whiistle_like_button_target(whiistle)
    dom_id(whiistle, :like_button)
  end

  def modal_body_target
    'modal_body'
  end

  def classes_including(class_name)
    ".#{class_name}"
  end

  def component(name, *args, **kwargs, &)
    name.to_s.camelize.constantize::Component.new(*args, **kwargs, &)
  end

  def components(name, *args, **kwargs, &)
    name.to_s.camelize.constantize::Component.with_collection(*args, **kwargs, &)
  end
end
