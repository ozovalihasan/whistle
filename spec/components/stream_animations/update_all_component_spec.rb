# frozen_string_literal: true

require "rails_helper"

RSpec.describe StreamAnimations::UpdateAllComponent, type: :component do
  before(:each) do
    mock_components([
      StreamAnimations::BaseComponent
    ])
  end

  it "renders correctly" do
    render_inline(described_class.new("mock_targets"))

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "StreamAnimations::BaseComponent(action: String, targets: String)"
  end
end
