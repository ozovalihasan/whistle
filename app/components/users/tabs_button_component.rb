# frozen_string_literal: true

class Users::TabsButtonComponent < ApplicationComponent
  def initialize(url:, text:, active_tab:)
    @url = url
    @text = text
    @active_tab = active_tab
  end

end
