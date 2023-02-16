# frozen_string_literal: true

class Streams::UpdateFlashesComponent < ApplicationComponent
  def initialize(notice:, alert:)
    @notice = notice
    @alert = alert
  end

end
