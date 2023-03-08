# frozen_string_literal: true

require "rails_helper"

RSpec.describe Whiistles::ButtonInner::Component, type: :component do
  context "if an optional argument is not provided" do
    
    it "renders correctly" do
      render_inline(described_class.new) { "mock_content" }

      expect(rendered_content).to match_custom_snapshot
      expect(rendered_content).to match "class=.*text-first"
      expect(rendered_content).to include "mock_content"
    end
  end

  context "if an optional argument `active` is provided as true" do
    
    it "renders correctly" do
        
      render_inline(described_class.new(active: true)) { "mock_content" }

      expect(rendered_content).to match_custom_snapshot("active-true")
      expect(rendered_content).to match "class=.*text-second"
    end
  end
end