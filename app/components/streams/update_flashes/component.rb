# frozen_string_literal: true

class Streams::UpdateFlashes::Component < Application::Component
  include Turbo::StreamsHelper

  def initialize(notice:, alert:)
    @notice = notice
    @alert = alert
  end
end
