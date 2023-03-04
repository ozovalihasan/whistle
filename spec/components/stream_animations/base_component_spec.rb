# frozen_string_literal: true

require "rails_helper"

RSpec.describe StreamAnimations::BaseComponent, type: :component do
  
  context "if any optional argument is not provided" do
    it "renders correctly" do

      render_inline(described_class.new(action: "mock_action")) { "mock_content"}

      expect(rendered_content).to match_custom_snapshot
      expect(rendered_content).to include 'action="mock_action"'
      expect(rendered_content).to include 'data-stream-enter-class="animate-cart-in"'
      expect(rendered_content).to include 'data-stream-exit-class="animate-cart-out"'
      expect(rendered_content).to include 'mock_content'
      
    end
  end
  
  context "if the optional argument 'target' is provided" do
    it "renders correctly" do

      render_inline(described_class.new(action: "mock_action", target: "mock_target")) { "mock_content"}

      expect(rendered_content).to match_custom_snapshot("with_target")
      expect(rendered_content).to include 'target="mock_target"'
    end
  end
  
  context "if the optional argument 'targets' is provided" do
    it "renders correctly" do

      render_inline(described_class.new(action: "mock_action", targets: "mock_targets")) { "mock_content"}

      expect(rendered_content).to match_custom_snapshot("with_targets")
      expect(rendered_content).to include 'targets="mock_targets"'
    end
  end

  context "if the optional argument 'enter_class' is provided" do
    it "renders correctly" do

      render_inline(described_class.new(action: "mock_action", enter_class: "mock_enter_class")) { "mock_content"}

      expect(rendered_content).to match_custom_snapshot("with_enter_class")
      expect(rendered_content).to include 'data-stream-enter-class="mock_enter_class" '
    end
  end

  context "if the optional argument 'exit_class' is provided" do
    it "renders correctly" do

      render_inline(described_class.new(action: "mock_action", exit_class: "mock_exit_class")) { "mock_content"}

      expect(rendered_content).to match_custom_snapshot("with_exit_class")
      expect(rendered_content).to include 'data-stream-exit-class="mock_exit_class" '
    end
  end
end
