# frozen_string_literal: true

class Streams::UpdateFlashesComponent < ApplicationComponent
  include Turbo::StreamsHelper
  
  def initialize(notice:, alert:)
    @notice = notice
    @alert = alert
  end

end
