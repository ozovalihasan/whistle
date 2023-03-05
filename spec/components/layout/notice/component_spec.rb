# frozen_string_literal: true

require "rails_helper"

RSpec.describe Layout::Notice::Component, type: :component do
  it "renders correctly" do

    render_inline( described_class.new(notice: "mock_notice") )

    expect(rendered_content).to match_custom_snapshot  
    expect(rendered_content).to match(/mock_notice/)
  end
end
