# frozen_string_literal: true

require "rails_helper"

RSpec.describe Layout::AlertComponent, type: :component do
  it "renders correctly" do

    render_inline( described_class.new(alert: "mock_alert") )

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match(/mock_alert/)
  end
end
