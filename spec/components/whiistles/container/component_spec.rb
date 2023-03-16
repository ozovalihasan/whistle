# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::Container::Component, type: :component do
  it "renders correctly" do
      
    render_inline(described_class.new) {"mock_content"}

    expect_snapshot_match
    expect(rendered_content).to include "mock_content"
  end
end
