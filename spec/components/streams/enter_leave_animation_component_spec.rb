# frozen_string_literal: true

require "rails_helper"

RSpec.describe Streams::EnterLeaveAnimationComponent, type: :component do
  it "renders correctly" do

    render_inline(described_class.new) { "mock_content"}

    expect(rendered_content).to match_custom_snapshot
    expect(rendered_content).to include "mock_content"
    expect(rendered_content).to include "data-stream-enter-class"
    expect(rendered_content).to include "data-stream-exit-class"
  end
end
