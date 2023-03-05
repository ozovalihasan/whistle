# frozen_string_literal: true

require "rails_helper"

RSpec.describe Users::TabsButton::Component, type: :component do
  context "if the tab is active tab" do
    it "renders correctly" do
      render_inline(described_class.new(url: "mock_url", text: "mock_text", active_tab: true))

      expect(rendered_content).to match_custom_snapshot("active_tab")  
      expect(rendered_content).to match "block py-2 px-4 text-blue-500 hover:text-blue-700 font-semibold no-underline border-b border-solid border-second"
      expect(rendered_content).to match "mock_text"
    end
  end

  context "if the tab is not active tab" do
    it "renders correctly" do
      render_inline(described_class.new(url: "mock_url", text: "mock_text", active_tab: false))

      expect(rendered_content).to match_custom_snapshot("inactive_tab")  
      expect(rendered_content).to match "block py-2 px-4 text-blue-500 hover:text-blue-700 font-semibold no-underline"
      expect(rendered_content).to match "mock_text"
    end
  end
end