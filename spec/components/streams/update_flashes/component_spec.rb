# frozen_string_literal: true

require "rails_helper"

RSpec.describe Streams::UpdateFlashes::Component, type: :component do
  it "renders correctly" do
    mock_components([
      Layout::Notice::Component,
      Layout::Alert::Component
    ])

    render_inline( described_class.new(alert: "mock_alert", notice: "mock_notice") )

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match(/Layout::Notice::Component/)
    expect(rendered_content).to match(/Layout::Alert::Component/)
    expect(rendered_content).to match(/turbo-stream/)
    expect(rendered_content).to match(/action="update"/)
    
  end
end
