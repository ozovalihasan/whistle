# frozen_string_literal: true

require "rails_helper"

RSpec.describe StreamAnimations::UpdateAll::Component, type: :component do
  it "renders correctly" do
    render_inline(described_class.new(targets: "mock_targets"))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "StreamAnimations::Base::Component(action: String, targets: String)"
  end
end
