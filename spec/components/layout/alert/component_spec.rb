# frozen_string_literal: true

require "rails_helper"

RSpec.describe Layout::Alert::Component, type: :component do
  it "renders correctly" do

    render_inline( described_class.new(alert: "mock_alert") )

    expect_snapshot_match  
    expect(rendered_content).to match(/mock_alert/)
  end
end
