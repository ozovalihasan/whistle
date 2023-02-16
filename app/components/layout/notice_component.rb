# frozen_string_literal: true

class Layout::NoticeComponent < ApplicationComponent
  def initialize(notice:)
    @notice = notice
  end

  def render?
    @notice
  end
end
