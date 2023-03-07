# frozen_string_literal: true

require "rails_helper"

RSpec.describe StreamAnimations::UpdateAll::Component, type: :component do
  before(:each) do
    mock_components([
      StreamAnimations::Base::Component
    ])
  end

  it "renders correctly" do
    render_inline(described_class.new("mock_targets"))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "StreamAnimations::Base::Component(action: String, targets: String)"
  end
end