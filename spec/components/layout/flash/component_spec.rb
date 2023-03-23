# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Layout::Flash::Component, type: :component do
  context "if it isn't alert" do
    it 'renders correctly' do
      render_inline(described_class.new(message: 'mock_message'))
  
      expect_snapshot_match
      expect(rendered_content).to match(/mock_message/)
      expect(rendered_content).to match(/bg-second/)
    end  
  end

  context "if it isn't alert" do
    it 'renders correctly' do
      render_inline(described_class.new(message: 'mock_message', alert: true))
  
      expect_snapshot_match("with-alert")
      expect(rendered_content).to match(/mock_message/)
      expect(rendered_content).to match(/bg-danger/)
    end  
  end
end
